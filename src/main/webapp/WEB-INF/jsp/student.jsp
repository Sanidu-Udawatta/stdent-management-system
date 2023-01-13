<%@include file="header.jsp" %>
<%@include file="auth.jsp" %>
<%@include file="nav-bar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="" style="   ">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-6 ">
                <img src="<c:url value="/resources/assets/images/Thesis-rafiki.svg" />"
                     class="img-fluid login-img" alt="Sample image">
            </div>

            <div class=" col-md-2 ">
                <a href="${pageContext.request.contextPath}/student/add-new" style="text-decoration: none">
                    <div class="shadow p-3 mb-5 bg-white rounded shadow-div">
                        <img src="<c:url value="/resources/assets/images/add-user.png" />"
                             class="img-fluid select-img" alt="Sample image">
                        <p class="select-title">
                            Add new Student
                        </p>
                    </div>
                </a>
            </div>
            <div class=" col-md-2">
                <div class="shadow p-3 mb-5 bg-white rounded shadow-div" onclick="viewStudentPopUp()">
                    <img src="<c:url value="/resources/assets/images/reviews.png" />"
                         class="img-fluid select-img" alt="Sample image">
                    <p class="select-title">
                        View Student
                    </p>
                </div>
            </div>
        </div>
    </div>

</section>

<div id="search-student-div">
    <div id="search-student-background">
    </div>

    <div id="search-student-from">
        <form action="${pageContext.request.contextPath}/student/view-details" method="GET">
            <img src="<c:url value="/resources/assets/images/close.png" />" alt="" class="close-btn"
                 onclick="closeStudentPopUp()">
            <p class="class-details-heading" style="margin-top: 40px">
                Search Student
            </p>

            <div class="row mb-4 search-div">
                <div class="col ">
                    <label class="label-search">Student 's Id</label>
                </div>


                <div class="col input-search">
                    <input type="text" class="form-control" placeholder="" name="id" id="studentId" required>
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

<script>
    function viewStudentPopUp() {
        document.getElementById("search-student-div").style.display = "block";

    }

    function closeStudentPopUp() {
        document.getElementById("search-student-div").style.display = "none";

    }
</script>

<%@include file="footer.jsp" %>


