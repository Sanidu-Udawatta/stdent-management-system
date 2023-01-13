<%@include file="header.jsp" %>
<%@include file="nav-bar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="payment-page-section">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-5 ">
                <img src="<c:url value="/resources/assets/images/E-Wallet-bro.svg"/>"
                     class="img-fluid login-img class-img" alt="Sample image">

            </div>

            <div class=" col-md-6 payment-div">
                <div class="shadow p-3 mb-5 bg-white rounded payment-details-div" style="height:500px">
                    <p class="class-details-heading">
                        Payment
                    </p>

                    <form class="row row-cols-lg-auto g-3 align-items-center payment-form " style="margin-left: 120px">
                        <div class="row mb-4">
                            <div class="col ">
                                <label class="form-label">Student Id</label>
                                <input type="text" class="form-control" placeholder="Student Id" id="studentId"
                                       name="studentId">
                            </div>

                            <div class="col ailing-div">
                                <label class="form-label">Student Name</label>

                                <input type="text" class="form-control disabled-input" disabled id="name"
                                       name="name">
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col ">
                                <label class="form-label">Subject</label>
                                <select id="subject" class="form-select width-select form-control " name="subject">
                                    <%--                                    <option value="0" disabled selected>Subject</option>--%>
                                </select>
                            </div>


                            <div class="col ailing-div">
                                <label class="form-label">Teacher's name</label>
                                <select id="teacherName" class="form-select width-select form-control "
                                        name="teacherName">
                                    <%--                                    <option value="0" disabled selected>Teacher</option>--%>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col ">
                                <label for="month" class="form-label">Month</label>
                                <select id="month" class="form-select width-select form-control" name="month">

                                </select>
                            </div>

                            <div class="col ailing-div ">
                                <label class="form-label">Payment</label>
                                <input type="number" class="form-control" placeholder="Rs.00.00" id="payment"
                                       name="payment">
                            </div>

                        </div>

                        <div class="row mb-4 btn-section">
                            <div class="col  ">
                                <button type="button" class="btn payment-pre-btn" onclick="viewStudentPopUp()">Previous
                                    Payment
                                </button>
                            </div>
                            <div class="col ">
                                <button type="reset" class="reset-btn-class">Reset</button>
                            </div>

                            <div class="col">
                                <button id="savePayment" type="button" class="new-btn  btn-primary search-btn-class "
                                        onclick="pay()">Pay
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</section>

<div id="search-student-div">
    <div id="search-student-background">
    </div>

    <div id="search-student-from">

        <img src="<c:url value="/resources/assets/images/close.png"/>" alt="" class="close-btn"
             onclick="closeStudentPopUp()">
        <p class="class-details-heading" style="margin-top: 40px">
            Previous Payment Search </p>

        <div class="row mb-4 search-div">
            <div class="col ">
                <label class="label-search">Student 's Id</label>
            </div>

            <div class="col input-search">
                <input type="text" class="form-control" placeholder="" id="searchPreviousPaymentsStudentId">
            </div>
        </div>

        <div class="row mb-2  ">
            <div class="btn-search">
                <button type="button" class="Search-btn-class" onclick="viewPreviousPaymentDetails()">Search</button>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

<script>
    function viewStudentPopUp() {
        document.getElementById("search-student-div").style.display = "block";

    }

    function closeStudentPopUp() {
        document.getElementById("search-student-div").style.display = "none";

    }
</script>

<script>
    $("#studentId").change(function () {
        loadStudentDetails();
        loadSubjectsForStudent();
    });

    $("#subject").change(function () {
        loadTeacherForSubject();
    });

    function loadStudentDetails() {
        let id = $("#studentId").val();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/payment/student-details?id=" + id,
            dataType: "json",
            success: function (result) {
                document.getElementById("name").value = result.firstName + " " + result.lastName;

            }
        });
    }

    function loadSubjectsForStudent() {
        let id = $("#studentId").val();
        $("#subject").empty();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/payment/student-subject?id=" + id,
            dataType: "json",
            success: function (result) {
                $("#subject").empty();
                result.map(value => {
                    $("#subject").append(
                        '<option value="' + value.classId + '">' + value.subjectName + '</option>'
                    )
                })
                loadTeacherForSubject();
            }
        });
    }

    function loadTeacherForSubject() {
        let classId = $("#subject").val();
        $("#teacherName").empty();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/payment/subject-teacher?classId=" + classId,
            dataType: "json",
            success: function (result) {
                result.map(value => {
                    console.log(value.firstName);
                    $("#teacherName").append(
                        '<option value="' + value.id + '">' + value.firstName + " " + value.lastName + '</option>'
                    )
                })
                loadPaymentMonth();
            }
        });
    }

    function loadPaymentMonth() {
        const id = $("#studentId").val();
        const classId = $("#subject").val();

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/payment/last-month?stdId=" + id + "&classId=" + classId,
            dataType: "json",
            success: function (result) {

                let month = document.getElementById("month");
                month.innerHTML = "";

                const currentMonth = new Date().getMonth() + 1;
                document.getElementById("savePayment").removeAttribute("disabled");

                if (result === 0) {

                    const option = document.createElement("option");
                    option.innerText = getMonth(currentMonth);
                    option.setAttribute("value", currentMonth + "");
                    option.setAttribute("selected", "true");
                    month.appendChild(option);
                } else {
                    const startIndex = result + 1;
                    if (startIndex > currentMonth) {
                        const option = document.createElement("option");
                        option.innerText = getMonth(currentMonth);
                        option.setAttribute("value", currentMonth + "");
                        option.setAttribute("selected", "true");
                        month.appendChild(option);
                        document.getElementById("savePayment").setAttribute("disabled", "true");
                    } else {
                        for (let i = startIndex; i <= currentMonth; i++) {
                            const option = document.createElement("option");
                            option.innerText = getMonth(i);
                            option.setAttribute("value", i + "");
                            if (i === startIndex) {
                                option.setAttribute("selected", "true");
                            }
                            month.appendChild(option);
                        }
                    }
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

    function pay() {
        const id = $("#studentId").val();
        const subject = $("#subject").val();
        const data = {
            "studentId": id,
            "classId": subject,
            "month": document.getElementById("month").value,
            "fee": document.getElementById("payment").value

        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/payment/proceed",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.message === "Payment saved successfully") {
                    Swal.fire({
                        title: 'Done!',
                        text: result.message,
                        icon: 'success'
                    }).then((result) => {
                        location.reload();
                    })
                } else {
                    Swal.fire({
                        title: 'Error!',
                        text: result.message,
                        icon: 'error'
                    }).then((result) => {
                        location.reload();
                    })
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

</script>
