<%@include file="header.jsp" %>
<%@include file="auth.jsp" %>
<%@include file="nav-bar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="class-page-section">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-5 ">
                <img src="<c:url value="/resources/assets/images/E-Wallet-bro.svg"/>"
                     class="img-fluid login-img class-img" alt="Sample image"/>

            </div>

            <div class=" col-md-6">
                <div class="shadow p-3 mb-5 bg-white rounded class-details-div">
                    <p class="class-details-heading">
                        Previous Payment
                    </p>

                    <form class="row row-cols-lg-auto g-3 align-items-center class-form">
                        <div class="row mb-4">
                            <div class="col-6">
                                <label  class="form-label">Student Name</label>

                                <input name="name" id="name" class="form-control disabled-input" placeholder="Name"
                                       style="height: 40px">
                            </div>


                            <div class="col-6">
                                <label class="form-label">Subject</label>

                                <select id="subject" class="form-select" style="width: 300px"
                                        name="subject" onchange="loadPaymentDetails()">
                                </select>
                            </div>
                        </div>

                    </form>
                    <table class="table align-middle mb-0 bg-white">
                        <thead class="bg-light">
                        <tr>
                            <th>Month</th>
                            <th>Payment</th>
                            <th>Payment Date & Time</th>

                        </tr>
                        </thead>
                        <tbody id="tabledata">


                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

</section>

<%@include file="footer.jsp" %>

<script>
    getEnrolledSubjects();

    function getEnrolledSubjects() {
        const studentId = ${id};

        const data = {
            "studentId": studentId
        };

        $.ajax({
            type: "POST",
            url: "functions/get-enrolled-subjects.php",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result === "Invalid Student ID") {
                    Swal.fire({
                        title: 'Error!',
                        text: result,
                        icon: 'error'
                    }).then((result) => {
                        window.location.href = "payment.php";
                    })
                } else {
                    document.getElementById("name").value = result.studentName;
                    const subject = document.getElementById("subject");
                    subject.innerHTML = "";
                    result.subjectArray.map(sub => {
                        let option = document.createElement("option");
                        option.setAttribute("value", sub.classId);
                        option.innerText = sub.subjectName + " - " + sub.teacherFirstName + " " + sub.teacherLastName;
                        subject.appendChild(option);
                    })
                    loadPaymentDetails();
                }
            },
            error: function (xhr, status, error) {
                console.log("Error");
                console.log(xhr);
                console.log(status);
                console.log(error);
            }
        })
    }

    function loadPaymentDetails() {
        const studentId = "<?php echo $studentId?>";
        const classId = $("#subject").val();

        const data = {
            "studentId": studentId,
            "classId": classId
        };

        $.ajax({
            type: "POST",
            url: "functions/get-previous-payments.php",
            dataType: "json",
            data: data,
            success: function (result) {
                let tableBody = document.getElementById("tabledata");
                tableBody.innerHTML = "";
                result.map(data => {
                    let tr = document.createElement("tr");

                    let month = document.createElement("td");
                    month.innerText = getMonth(parseInt(data.month));
                    tr.appendChild(month);

                    let payment = document.createElement("td");
                    payment.innerText = data.payment;
                    tr.appendChild(payment);

                    let dateTime = document.createElement("td");
                    dateTime.innerText = data.date;
                    tr.appendChild(dateTime);
                    tableBody.appendChild(tr);
                })
            },
            error: function (xhr, status, error) {
                console.log("Error");
                console.log(xhr);
                console.log(status);
                console.log(error);
            }
        })
    }

    function getMonth(n) {
        switch (n) {
            case 1:
                return "January";
            case 2:
                return "February";
            case 3:
                return "March";
            case 4:
                return "April";
            case 5:
                return "May";
            case 6:
                return "June";
            case 7:
                return "July";
            case 8:
                return "August";
            case 9:
                return "September";
            case 10:
                return "October";
            case 11:
                return "November";
            case 12:
                return "December";

        }
    }
</script>
