<%@include file="header.jsp"%>
<%@include file="auth.jsp" %>
<div class="heading-name">
    <p class="heading-name-para">
        Teacher Registration Form
    </p>
</div>
<div class="container-xl px-4 mt-4 ">

    <div class="row row-margin d-flex justify-content-center">

        <div class="col-lg-8">
            <div class="card mb-4 body-radius">
                <div class="card-body">
                    <form class="row aling" method="post" onsubmit="return validateForm()" name="teacherFrom"
                          id="teacherFrom">

                        <div class="col input-search">
                            <p class="sub-heading-name-para">
                                Registration ID
                            </p>
                            <div class="form-control student-id-input w-25">
                                <span name="span" class="span" id="teacher-id">

                                </span>
                            </div>
                        </div>

                        <div class="align-con">
                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label for="inputFName">First name</label>
                                    <input type="text" class="form-control " id="fName" placeholder="Enter First name"
                                           name="fName">
                                </div>

                                <div class="col-6 std">
                                    <label for="inputLName">Last name</label>
                                    <input type="text" class="form-control " id="lName" placeholder="Enter Last name"
                                           name="lName">
                                </div>

                            </div>


                            <div class="row mb-4 ">

                                <div class="col-6 std">
                                    <label for="dropDownGender">Gender</label>
                                    <select id="gender" class="form-select form-control  gender-drop-down"
                                            name="gender">
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>


                                <div class="col-6 std">
                                    <label for="inputTel">Contact No</label>
                                    <input type="tel" class="form-control " id="tel" placeholder="Contact No"
                                           name="tel">
                                </div>
                            </div>


                            <div class="row mb-4 ">
                                <div class="col input-lg-width">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" class="form-control input-lg-width" id="address" name="address"
                                           placeholder="Enter Address">
                                </div>
                            </div>

                            <div class="row mb-4 ">
                                <div class="col-6 std ">
                                    <label for="inputSubject">Subject</label>
                                    <select id="subject" class="form-select form-control Grade-drop-down"
                                            name="subject">
                                        <!--load subject-->
                                        <?php
                                        while ($row = $result_set_subject->fetch_assoc()) {
                                        ?>
                                        <option><?php echo $row['name']; ?> </option>

                                        <?php } ?>
                                    </select>
                                </div>


                                <div class="col-6 std ">
                                    <label for="inputGrade">Grade</label>
                                    <select id="grade" class="form-select form-control  Grade-drop-down" name="grade">
                                        <!--load grade-->

<%--                                        <?php--%>
<%--                                        while ($row = $result_set_grade->fetch_assoc()) {--%>
<%--                                        ?>--%>
<%--                                        <option><?php echo $row['name']; ?> </option>--%>

<%--                                        <?php } ?>--%>


                                    </select>
                                </div>

                            </div>

                            <div class="row mb-4 ">
                                <div class="col-4  ">
                                    <label for="inputSubject">Day</label>
                                    <select id="day" class="form-select form-control  Grade-drop-down" name="day">
                                        <option>Monday</option>
                                        <option>Tuesday</option>
                                        <option>Wednesday</option>
                                        <option>Thursday</option>
                                        <option>Friday</option>
                                        <option>Saturday</option>
                                        <option>Sunday</option>
                                    </select>
                                </div>


                                <div class="col-4  ">
                                    <label for="inputGrade">Time</label>
                                    <input type="time" class="form-control " id="time" placeholder="" name="time">
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
                                    <th scope="col" style="font-weight: bold">Grade</th>
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
                                    <a href="teacher.php">
                                        <button type="button" class="btn btn-primary  search-btn-class"
                                        >Exit
                                        </button>
                                    </a>
                                </div>


                                <div class="col">

                                    <button type="reset" class="reset-btn-class button-right-reset" onclick="resetBtn();">Reset</button>
                                    <!--                            <input type="button" class="btn btn-primary btn-sm" value="save" id="save" name="save">-->
                                    <!--                            <button type="button" class="button-add" name="save" id="save">-->
                                    <!--                                Save-->
                                    <!--                            </button>-->
                                </div>

                                <div class="col ">
                                    <button type="button" class="btn btn-primary  search-btn-class button-right"
                                            name="save"
                                            id="save">
                                        Save
                                    </button>
                                </div>
                            </div>
                            <p id="demo"></p>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="assets/js/add-new-teacher.js"></script>
<script>
    $('#add_data').click(function () {
        var subject = $('#subject').val();
        var grade = $('#grade').val();
        var day = $('#day').val();
        var time = $('#time').val();


        let today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        const yyyy = today.getFullYear();
        today = mm + '/' + dd + '/' + yyyy;

        //append inputs to table
        $('#data_table tbody:last-child').append(
            '<tr>' +
            '<td>' + subject + '</td>' +
            '<td>' + grade + '</td>' +
            '<td>' + day + '</td>' +
            '<td>' + time + '</td>' +
            '<td>' + today + '</td>' +
            '<td> <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"  name="delete" onclick="delSubject(this);"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a> </td>'+
            '</tr>'
        );


        // //clear input
        // $('#subject').val('');
        // $('#grade').val('');
        // $('#day').val('');
        // $('#time').val('');
    });

    function resetBtn(){
        location.reload(true)
    }

    function delSubject(subject){
        var s = subject.parentNode.parentNode;
        s.parentNode.removeChild(s);

    }

    $("#save").click(function () {

        var teacherId = parseFloat(document.getElementById("teacher-id").innerText);
        console.log(teacherId)
        var subject = $("#subject").val();
        var fName = $("#fName").val();
        var lName = $("#lName").val();
        var gender = $("#gender").val();
        var tel = $("#tel").val();
        var address = $("#address").val();

        $.ajax({
            type: "POST",
            url: 'functions/save-teacher.php',
            dataType: 'json',
            data: {
                teacherId: teacherId,
                subject: subject,
                fName: fName,
                lName: lName,
                gender: gender,
                tel: tel,
                address: address
            },
            success: function (result) {
                console.log(result)
                $("#data_table tr").each(function (row, tr) {

                    if ($(tr).find('td:eq(0)').text() === "") {

                    } else {

                        $.ajax({
                            type: "POST",
                            url: 'functions/save-class.php',
                            dataType: 'json',
                            data: {
                                teacherId: teacherId,
                                subject: $(tr).find('td:eq(0)').text(),
                                grade: $(tr).find('td:eq(1)').text(),
                                day: $(tr).find('td:eq(2)').text(),
                                time: $(tr).find('td:eq(3)').text(),
                                today: $(tr).find('td:eq(4)').text()
                            },
                            success: function (result) {
                                Swal.fire({
                                    title: 'Done!',
                                    text: 'Teacher Details Saved Successfully',
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


        // location.reload();
    });


</script>

<%@include file="footer.jsp"%>
