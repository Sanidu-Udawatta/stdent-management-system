<%@include file="header.jsp" %>
<%@include file="nav-bar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="" style="   ">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-6 ">
                <img src="<c:url value="/resources/assets/images/Seminar-amico.svg"/>"
                     class=" img-fluid login-img" alt="Sample image">

            </div>

            <div class="col-md-2">
                <a href="add-new-teacher.php" style="text-decoration: none">
                    <div class="shadow p-3 mb-5 bg-white rounded shadow-div">
                        <img src="<c:url value="/resources/assets/images/add-user.png"/>"
                             class=" img-fluid select-img" alt="Sample image">
                        <p class="select-title">
                            Add new Teacher
                        </p>
                    </div>
                </a>
            </div>
            <div class=" col-md-2">

                <div class="shadow p-3 mb-5 bg-white rounded shadow-div" onclick="viewTeacherPopUp()">
                    <img src="<c:url value="/resources/assets/images/reviews.png"/>"
                         class="img-fluid select-img" alt="Sample image">
                    <p class="select-title">
                        View Teacher
                    </p>
                </div>

            </div>
        </div>
    </div>

</section>

<div id="search-teacher-div">
    <div id="search-teacher-background">
    </div>

    <div class="search-teacher-from">

        <form action="view-teacher.php" method="post">
            <img src="assets/images/close.png" alt="" class="close-btn" onclick="closeTeacherPopUp()">
            <p class="class-details-heading" style="margin-top: 40px">
                Search Teacher
            </p>

            <div class="row mb-4 search-div">
                <div class="col ">
                    <label class="label-search">Teacher 's Id</label>
                </div>

                <div class="col input-search">
                    <input type="text" class="form-control" name="teacherId" id="teacherId" required>
                </div>
            </div>

            <div class="row mb-2  ">
                <div class="btn-search">
                    <button type="submit" class="Search-btn-class">Search</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%@include file="footer.jsp" %>
