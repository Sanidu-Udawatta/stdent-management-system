<%@include file="header.jsp" %>

<div class="heading-name">
    <p class="heading-name-para">
        Student Registration Form Update
    </p>
</div>
<div class="container-xl px-4 mt-4 ">

    <div class="row row-margin d-flex justify-content-center">

        <div class="col-lg-8">
            <div class="card mb-4 body-radius">
                <div class="card-body">
                    <form class="row aling">

                        <div class="col input-search">
                            <p class="sub-heading-name-para">
                                Registration ID
                            </p>
                            <input type="text" class="form-control student-id-input w-25" name="id" id="id" disabled>
                        </div>

                        <div class="align-con">
                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>First name</label>
                                    <input type="text" class="form-control" id="fName" name="fName">
                                </div>

                                <div class="col-6 std">
                                    <label>Last name</label>
                                    <input type="text" class="form-control " id="lName" name="lName">
                                </div>

                            </div>


                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>Date of birth</label>
                                    <input type="date" class="form-control" id="dob" name="dob">
                                </div>

                                <div class="col-6 std">
                                    <label>Gender</label>
                                    <select id="gender" class="form-select form-control  gender-drop-down"
                                            name="gender">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col input-lg-width">
                                    <label>School</label>
                                    <input type="text" class="form-control input-lg-width" id="school" name="school">
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col input-lg-width">
                                    <label>Address</label>
                                    <input type="text" class="form-control input-lg-width" id="address" id="address">
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>Guardian Name</label>
                                    <input type="text" class="form-control " id="guardianName" name="guardianName">
                                </div>

                                <div class="col-6 std">
                                    <label>Contact No</label>
                                    <input type="tel" class="form-control " id="contact" name="contact">
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>Grade</label>
                                    <select id="grade" class="form-select form-control  Grade-drop-down"
                                            name="grade"
                                            name="grade" onchange="getSubjectsForGrade()">
                                        <c:forEach items="${gradeList}" var="grade">
                                            <option value="${grade.name}">${grade.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                            <div class="row mb-4 ">
                                <div class="col-6 std">
                                    <label for="subject">Subject</label>
                                    <select id="subject" class="form-select form-control  Grade-drop-down"
                                            onchange="getTeachersForSubject()"
                                            name="subject">
                                        <option value="0" disabled selected>subject</option>

                                    </select>
                                </div>

                                <div class="col-6  std" id="tec">
                                    <label>Teacher</label>
                                    <select id="teacher" class="form-select form-control  Grade-drop-down"
                                            name="teacher">
                                        <option value="0" disabled selected>teacher</option>
                                    </select>
                                </div>


                            </div>
                            <div class="row mb-4 ">
                                <div class="col-4  ">
                                    <label>Day</label>
                                    <select id="day" class="form-select form-control  Grade-drop-down"
                                            name="day">
                                        <option value="0" disabled selected>day</option>
                                    </select>


                                </div>


                                <div class="col-4  ">
                                    <label>Time</label>
                                    <select id="time" class="form-select form-control  Grade-drop-down"
                                            name="time">
                                        <option value="0" disabled selected>time</option>
                                    </select>
                                </div>

                                <div class="col-2 ">

                                    <button type="button" class="button-add" name="add_data" id="add_data">
                                        add
                                    </button>
                                </div>
                            </div>

                            <!--table-->

                            <table class="table table-bordered table-width" id="data_table">
                                <thead class="t-head">
                                <tr>

                                    <th scope="col" style="font-weight: bold">Subject</th>
                                    <th scope="col" style="font-weight: bold">Teacher 's name</th>
                                    <th scope="col" style="display: none">Teacher id</th>
                                    <th scope="col" style="font-weight: bold">Day</th>
                                    <th scope="col" style="font-weight: bold">Time</th>
                                    <th scope="col" style="font-weight: bold">Reg Date</th>
                                    <th scope="col" style="font-weight: bold">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${classes}" var="c">
                                    <tr>
                                        <td>${c.subject}</td>
                                        <td>${c.teachFirstName} ${" "} ${c.teachLastName}</td>
                                        <td style="display: none">${c.teacherId}</td>
                                        <td>${c.day}</td>
                                        <td>${c.time}</td>
                                        <td>${c.regDate}</td>
                                        <td><a href="#deleteEmployeeModal" class="delete" data-toggle="modal"
                                               name="delete"
                                               onclick="removeStudent(this);"><i class="material-icons"
                                                                                 data-toggle="tooltip"
                                                                                 title="Delete">&#xE872;</i></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!--button-->

                            <div class="row mb-4 button-width">
                                <div class="col ">
                                    <button type="button" class="btn reset-btn-class"
                                            onclick="getBackToStudentDetails()"
                                    >Exit
                                    </button>
                                </div>

                                <div class="col ">
                                    <button type="button" name="save"
                                            id="save" class="btn btn-primary" style="position:absolute;right: 100px;">
                                        Update
                                    </button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    function getBackToStudentDetails() {
        window.location.href = "${pageContext.request.contextPath}/student/view-details?id=${id}";
    }

    function addRow() {
        const subject = document.getElementById("subject").value;
        const tValue = document.getElementById("teacher");
        const teacher = tValue.options[tValue.selectedIndex].text;
        const day = document.getElementById("day").value;
        const time = document.getElementById("time").value;

        let today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        const yyyy = today.getFullYear();
        today = mm + '/' + dd + '/' + yyyy;

        const table = document.getElementsByTagName('table')[0];


        const newRow = table.insertRow(1);

        const cel1 = newRow.insertCell(0);
        const cel2 = newRow.insertCell(1);
        const cel3 = newRow.insertCell(2);
        const cel4 = newRow.insertCell(3);
        const cel5 = newRow.insertCell(4);

        cel1.innerHTML = subject;
        cel2.innerHTML = teacher;
        cel3.innerHTML = day;
        cel4.innerHTML = time;
        cel5.innerHTML = today;


    }

    $('#add_data').click(function () {
        var subject = $('#subject').val();
        const teacher = $("#teacher option:selected").text();
        var teacherId = $("#teacher").val();
        var day = $('#day').val();
        var time = $('#time').val();


        let today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        const yyyy = today.getFullYear();
        today = mm + '/' + dd + '/' + yyyy;

        // append inputs to table
        $('#data_table tbody:last-child').append(
            '<tr>' +
            '<td>' + subject + '</td>' +
            '<td>' + teacher + '</td>' +
            '<td style="display: none">' + teacherId + '</td>' +
            '<td>' + day + '</td>' +
            '<td>' + time + '</td>' +
            '<td>' + today + '</td>' +
            '<td> <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"  name="delete" onclick="delStudent(this);"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a> </td>' +
            '</tr>'
        );

    });

    function delStudent(stud) {
        var s = stud.parentNode.parentNode;
        s.parentNode.removeChild(s);

    }

    function removeStudent(element) {
        const studentId = parseFloat(document.getElementById("id").value);
        const grade = $("#grade").val();

        let tableRow = element.parentElement.parentElement;
        let tds = tableRow.getElementsByTagName("td");
        const subject = tds[0].innerText.trim();
        const teacherId = tds[2].innerText.trim();
        const day = tds[3].innerText.trim();
        const time = tds[4].innerText.trim();

        const data = {
            "studentId": studentId,
            "grade": grade,
            "subject": subject,
            "teacherId": teacherId,
            "day": day,
            "time": time,
        };
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: '${pageContext.request.contextPath}/class/deleteClass',
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        console.log(result)

                        swalWithBootstrapButtons.fire(
                            'Deleted!',
                            'Student Enrollment Removed Successfully',
                            'success'
                        ).then((result) => {
                            let s = element.parentNode.parentNode;
                            s.parentNode.removeChild(s);
                        })
                    },
                    error: function (xhr, status, error) {
                        console.log("error")
                        console.log(xhr)
                        console.log(status)
                        console.log(error)
                    }
                });

            } else if (
                /* Read more about handling dismissals below */
                result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithBootstrapButtons.fire(
                    'Cancelled',
                    'Your imaginary file is safe :)',
                    'error'
                )
            }
        })


    }

</script>

<script type="text/javascript">

    getSubjectsForGrade();

    $("#teacher").change(function () {
        getDaysForTeacher();

    });

    $("#day").change(function () {
        getTimeForTeacher();

    });

    function getSubjectsForGrade() {
        $("#subject").empty();
        const grade = document.getElementById("grade").value;
        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/subject/grade?grade=' + grade,
            dataType: 'json',
            success: function (result) {
                result.map(value => {
                    $("#subject").append(
                        '<option value="' + value + '">' + value + '</option>'
                    )
                })
                getTeachersForSubject();
            },
            error: function (xhr, status, error) {
                console.log("error")
                console.log(xhr);
                console.log(status);
                console.log(error);
            }
        });
    }

    function getTeachersForSubject() {
        $("#teacher").empty();
        const subject = $("#subject").val();
        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/subject/subject?subject=' + subject,
            dataType: 'json',
            success: function (result) {
                console.log(result);
                result.map(value => {
                    $("#teacher").append(
                        '<option value="' + value.id + '">' + value.firstName + " " + value.lastName + '</option>'
                    )
                })
                getDaysForTeacher();
            }
        })
    }

    function getDaysForTeacher() {
        $("#day").empty();
        var grade = $("#grade").val();
        var subject = $("#subject").val();
        var teacher = $("#teacher").val();
        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/subject/days?grade=' + grade + '&subject=' + subject + '&teacher=' + teacher,
            dataType: 'json',
            success: function (result) {
                result.map(value => {
                    $("#day").append(
                        '<option value="' + value + '">' + value + '</option>'
                    )
                })
                getTimeForTeacher();
            }
        })
    }

    function getTimeForTeacher() {
        $('#time').empty();
        var grade = $("#grade").val();
        var subject = $("#subject").val();
        var teacher = $("#teacher").val();
        var day = $("#day").val();
        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/subject/time?grade=' + grade + '&subject=' + subject + '&teacher=' + teacher + '&day=' + day,
            dataType: 'json',
            success: function (result) {
                result.map(value => {
                    $("#time").append(
                        '<option value="' + value + '">' + value + '</option>'
                    )
                })
            }

        })
    }

    $(document).on('click', '.remove_details', function () {
        var row_id = $(this).attr("id");
        if (confirm("are you sure want to remove this row data?")) {
            $('#row_' + row_id + "").remove();
        } else {
            return false;
        }
    });
</script>

<script>
    function getStudentDetails() {
        document.getElementById("id").value = "${id}";
        document.getElementById("fName").value = "${firstName}";
        document.getElementById("lName").value = "${lastName}";
        document.getElementById("dob").value = "${dob}";
        document.getElementById("school").value = "${school}";
        document.getElementById("gender").value = "${gender}";
        document.getElementById("address").value = "${address}";
        document.getElementById("guardianName").value = "${guardianName}";
        document.getElementById("contact").value = "${guardianPhone}";
        document.getElementById("grade").value = "${grade}";
    }

    getStudentDetails();


    $('#save').click(function () {
        var studentId = parseFloat(document.getElementById("id").value);
        var fName = $("#fName").val();
        var lName = $("#lName").val();
        var dob = $("#dob").val();
        var gender = $("#gender").val();
        var school = $("#school").val();
        var address = $("#address").val();
        var grade = $("#grade").val();
        var guardianName = $("#guardianName").val();
        var contact = $("#contact").val();

        const requestBody = {
            id: studentId,
            firstName: fName,
            lastName: lName,
            dob: dob,
            school: school,
            gender: gender,
            grade: grade,
            address: address,
            guardianName: guardianName,
            contactNo: contact
        }
        console.log(fName);
        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/student/update-student',
            dataType: 'json',
            data: requestBody,
            success: function (result) {
                $("#data_table tr").each(function (row, tr) {

                    if ($(tr).find('td:eq(0)').text() === "") {

                    } else {

                        const data = {
                            studentId: studentId,
                            grade: grade,
                            subject: $(tr).find('td:eq(0)').text().trim(),
                            teacherId: parseFloat($(tr).find('td:eq(2)').text().trim()),
                            day: $(tr).find('td:eq(3)').text().trim(),
                            time: $(tr).find('td:eq(4)').text().trim(),
                        };

                        $.ajax({
                            type: "POST",
                            url: '${pageContext.request.contextPath}/class/update-student-class',
                            dataType: 'json',
                            data: data,
                            success: function (result) {
                                console.log(result);
                                Swal.fire({
                                    title: 'Done!',
                                    text: 'Student Details Saved Successfully',
                                    icon: 'success'
                                }).then((result) => {
                                    location.reload();
                                })
                            },

                            error: function (xhr, status, error) {
                                console.log("error")
                                console.log(xhr);
                                console.log(status);
                                console.log(error);
                                alert("Something Went Wrong");
                            }
                        });
                    }
                });
            },
            error: function (xhr, status, error) {
                console.log("error")
                console.log(xhr);
                console.log(status);
                console.log(error);
                alert("Something Went Wrong");
            }

        });

    })
</script>


<%@include file="footer.jsp" %>
