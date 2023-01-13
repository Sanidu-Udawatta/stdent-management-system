<%@include file="header.jsp"%>

<span id="sid" name="sid">
<?php

</span>


<div class="heading-name">
    <p class="heading-name-para">
        Teacher's Details
    </p>
</div>
<div class="container-xl px-4 mt-4 ">

    <div class="row row-margin d-flex justify-content-center">

        <div class="col-lg-8">
            <div class="card mb-4 body-radius">
                <div class="card-body">
                    <form class="row  form-inline" >

                        <div class="col input-search">
                            <p class="sub-heading-name-para" >
                                Registration ID
                            </p>
                            <input type="text" class="form-control student-id-input w-25" placeholder="0000" disabled id="id" name="id">
                        </div>
                        <div class="form-align">
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label label-width">Name </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="name" name="name" disabled>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="gender" class="col-sm-2 col-form-label label-width">Gender </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="gender" name="gender" disabled>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="contactNo" class="col-sm-2 col-form-label label-width">Contact No </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="contactNo" name="contactNo" disabled>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="address" class="col-sm-2 col-form-label label-width">Address </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="address" name="address" disabled>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="class" class="col-sm-2 col-form-label label-width">Classes </label>
                            </div>
                            <!--table-->

                            <table class="table table-bordered table-width table-margin">
                                <thead>
                                <tr>

                                    <th scope="col">Subject</th>
                                    <th scope="col">Grade</th>
                                    <th scope="col">Day</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Reg Date</th>
                                </tr>
                                </thead>
<%--                                <tbody id="tabledata">--%>

<%--                                </tbody>--%>
                            </table>


                            <!--button-->
                            <div class="row mb-4 button-width">
                                <div class="col ">
                                    <a href="">
                                        <button type="button" class=" btn reset-btn-class "
                                        >Exit
                                        </button>
                                    </a>
                                </div>

                                <div class="col ">
                                    <button type="button"
                                            class="btn btn-primary  search-btn-class button-right update-btn-class" onclick="updateTeacher();">
                                        update
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
    getTeacherDetails();
    getTableLoad();


    function getTeacherDetails() {
        const teacherId = "<?php echo $teacherId?>";
        console.log(teacherId)
        $.ajax({
            type: "GET",
            url: 'functions/get-teacher-details-view.php',
            data: {
                "teacherId": teacherId
            },
            success: function (result) {
                console.log(result);
                const counts = JSON.parse(result);
                document.getElementById("id").value = counts.sid;
                document.getElementById("name").value = counts.sName;
                document.getElementById("gender").value = counts.gender;
                document.getElementById("address").value = counts.address;
                document.getElementById("contactNo").value = counts.contactNo;
                // console.log(sName);

            },
            error: function (xhr, status, error) {
                console.log("error")
                console.log(xhr)
                console.log(status)
                console.log(error)
            }
        });
    }

    function getTableLoad(){
        const tId = "<?php echo $teacherId?>";
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", "functions/get-teacher-details-view.php?tId=" + tId, false)
        xmlhttp.send(null);
        console.log(xmlhttp.responseText);
        $("#tabledata").html(xmlhttp.responseText)
    }


    function updateTeacher() {
        const teacherId = "<?php echo $teacherId?>";
        window.location.href = "update-teacher.php?id=" + teacherId;
    }

</script>

<%@include file="footer.jsp"%>>
