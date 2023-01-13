<%@include file="header.jsp" %>
<%@include file="auth.jsp" %>

<span id="sid" name="sid">
</span>
<div class="heading-name">
    <p class="heading-name-para">
        Student's Details
    </p>
</div>
<div class="container-xl px-4 mt-4 ">

    <div class="row row-margin d-flex justify-content-center">

        <div class="col-lg-8">
            <div class="card mb-4 body-radius">
                <div class="card-body">
                    <form class="row  form-inline">

                        <div class="col input-search">
                            <p class="sub-heading-name-para">
                                Registration ID
                            </p>
                            <input type="text" class="form-control student-id-input w-25" placeholder="0000" disabled
                                   name="id" id="id" value="${id}">

                        </div>
                        <div class="form-align">
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label label-width">Name </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="name" name="name" disabled
                                           value="${firstName}${" "}${lastName}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="dob" class="col-sm-2 col-form-label label-width">Date Of Birth </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class=" border-none" id="dob" name="dob" disabled value="${dob}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="school" class="col-sm-2 col-form-label label-width">School </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="school" name="school" disabled
                                           value="${school}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="gender" class="col-sm-2 col-form-label label-width">Gender </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="gender" name="gender" disabled
                                           value="${gender}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="address" class="col-sm-2 col-form-label label-width">Address </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="address" name="address" disabled
                                           value="${address}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="guardianName" class="col-sm-2 col-form-label label-width">Guardian
                                    Name </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="guardianName" name="guardianName"
                                           disabled value="${guardianName}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="contactNo" class="col-sm-2 col-form-label label-width">Contact No </label>
                                <div class="col-sm-10 input-width-view-std">
                                    <input type="text" class="border-none" id="contactNo" name="contactNo" disabled
                                           value="${guardianPhone}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label label-width">Classes </label>
                            </div>

                            <!--table-->

                            <table class="table table-bordered table-width table-margin">
                                <thead>
                                <tr>

                                    <th scope="col">Subject</th>
                                    <th scope="col">Teacher</th>
                                    <th scope="col">Day</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Reg Date</th>
                                </tr>
                                <c:forEach items="${classes}" var="c">
                                    <tr>
                                        <td>${c.subject}</td>
                                        <td>${c.teachFirstName} ${" "} ${c.teachLastName}</td>
                                        <td>${c.day}</td>
                                        <td>${c.time}</td>
                                        <td>${c.regDate}</td>
                                    </tr>
                                </c:forEach>
                                </thead>
                            </table>


                            <!--button-->
                            <div class="row mb-4 button-width">
                                <div class="col ">
                                    <a href="${pageContext.request.contextPath}/home">
                                        <button type="button" class=" btn reset-btn-class "
                                        >Exit
                                        </button>
                                    </a>
                                </div>

                                <div class="col ">
                                    <button type="button" id="update" onclick="getStudentDetails()"
                                            class="btn-primary btn " style="position:absolute;right: 100px;"
                                    >
<%--                                        search-btn-class button-right update-btn-class--%>
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
<%@include file="footer.jsp" %>

<script>
    // $('#update').click(function () {
    function getStudentDetails() {
        window.location.href = "${pageContext.request.contextPath}/student/update-view?id=${id}";
    }
</script>
