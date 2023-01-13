<%@include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="heading-name">
    <p class="heading-name-para">
        Student Registration Form
    </p>
</div>
<div class="container-xl px-4 mt-4 ">

    <div class="row row-margin d-flex justify-content-center">

        <div class="col-lg-8">
            <div class="card mb-4 body-radius">
                <div class="card-body">
                    <form class="row aling" method="post" onsubmit="return validateForm()" name="studentFrom"
                          id="studentFrom">

                        <div class="col input-search">
                            <p class="sub-heading-name-para">
                                Registration ID
                            </p>
                            <div class="student-id-input form-control">
                                <span name="span" class="span" id="student-id">
                                    ${nextStudentId}
                                </span>
                            </div>

                        </div>

                        <div class="align-con">
                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>First name</label>
                                    <input type="text" class="form-control " id="fName" placeholder="First name"
                                           name="fName">
                                </div>

                                <div class="col-6 std">
                                    <label>Last name</label>
                                    <input type="text" class="form-control " id="lName" placeholder="Last name"
                                           name="lName" required>
                                </div>

                            </div>


                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>Date of birth</label>
                                    <input type="date" class="form-control" id="dob" placeholder="DD/MM/YYYY"
                                           name="dob">
                                </div>

                                <div class="col-6 std">
                                    <label>Gender</label>
                                    <select id="gender" class="form-select form-control  gender-drop-down"
                                            name="gender">
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col input-lg-width">
                                    <label>School</label>
                                    <input type="text" class="form-control input-lg-width" id="school"
                                           placeholder="Enter School" name="school">
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col input-lg-width">
                                    <label>Address</label>
                                    <input type="text" class="form-control input-lg-width" id="address"
                                           placeholder="Enter Address" name="address">
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label>Guardian Name</label>
                                    <input type="text" class="form-control " id="guardianName"
                                           placeholder="Guardian Name"
                                           name="guardianName">
                                </div>

                                <div class="col-6 std">
                                    <label>Contact No</label>
                                    <input type="tel" class="form-control " id="contact" placeholder="Contact No"
                                           name="contactNo">
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
                                            name="subject" onchange="getTeachersForSubject()">
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

                                </tbody>
                            </table>


                            <!--button-->
                            <div class="row mb-4 button-width">
                                <div class="col ">
                                    <a href="${pageContext.request.contextPath}/home">
                                        <button type="button" class="btn btn-primary  search-btn-class"
                                        >Exit
                                        </button>
                                    </a>
                                </div>


                                <div class="col">

                                    <button type="reset" class="reset-btn-class button-right-reset">Reset</button>

                                </div>

                                <div class="col ">
                                    <button type="button" class="btn btn-primary"
                                            name="save" style="position:absolute;right: 100px;"
                                            id="save">
                                        Save
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
        // const tValue = tValue.options[tValue.selectedIndex].text();
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

    function getError() {
        return function (xhr, status, error) {
            console.log("error")
            console.log(xhr);
            console.log(status);
            console.log(error);
            alert("Something Went Wrong");
        };
    }

    function getError1() {
        return function (xhr, status, error) {
            console.log("error")
            console.log(xhr);
            console.log(status);
            console.log(error);
            alert("Something Went Wrong");
        };
    }

    $('#save').click(function () {
        var studentId = parseFloat(document.getElementById("student-id").innerText);
        console.log(studentId)
        var fName = $("#fName").val();
        var lName = $("#lName").val();
        var dob = $("#dob").val();
        var gender = $("#gender").val();
        var school = $("#school").val();
        var address = $("#address").val();
        var grade = $("#grade").val();
        var guardianName = $("#guardianName").val();
        var contact = $("#contact").val();

        const classes = [];

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
            contactNo: contact,
        };

        console.log(requestBody)
        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/student/save',
            dataType: 'json',
            data: requestBody,
            success: function (result) {
                $("#data_table tr").each(function (row, tr) {

                    if ($(tr).find('td:eq(0)').text() === "") {

                    } else {

                        $.ajax({
                            type: "POST",
                            url: '${pageContext.request.contextPath}/class/saveClass',
                            dataType: 'json',
                            data: {
                                studentId: studentId,
                                grade: grade,
                                subject: $(tr).find('td:eq(0)').text(),
                                teacherId: $(tr).find('td:eq(2)').text(),
                                day: $(tr).find('td:eq(3)').text(),
                                time: $(tr).find('td:eq(4)').text(),

                            },
                            success: function (result) {
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

    function clearForm (){
        document.getElementById("studentFrom").reset();
    }

    function clearTable(){
        $("#data_table").empty()
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


<%@include file="footer.jsp" %>
