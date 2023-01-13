<%@include file="header.jsp" %>
<%@include file="auth.jsp" %>
<%@include file="nav-bar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="class-page-section">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-5 ">
                <img src="<c:url value="/resources/assets/images/Teacher-rafiki.svg"/>"
                     class="img-fluid login-img class-img" alt="Sample image">

            </div>

            <div class=" col-md-6">
                <div class="shadow p-3 mb-5 bg-white rounded class-details-div">
                    <p class="class-details-heading">
                        Search Classes
                    </p>

                    <form class="row row-cols-lg-auto g-3 align-items-center class-form ">
                        <div class="row mb-4">
                            <div class="col ">
                                <label class="form-label">Grade</label>
                                <select id="grade" class="form-select   Grade-drop-down width-select "
                                        onchange="getSubjectsForGrade()"
                                        name="grade">
                                    <c:forEach items="${gradeList}" var="grade">
                                        <option value="${grade.name}">${grade.name}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <div class="col">
                                <label class="form-label">Subject</label>


                                <select id="subject" class="form-select width-select"
                                        name="subject">
                                    <option value="0" disabled selected>subject</option>

                                </select>
                            </div>


                            <div class="col">

                                <button type="button" class="btn btn-primary  submit-btn-class" id="search-btn"
                                        onclick="getClassDetails()"
                                        name="search-btn">Search
                                </button>
                            </div>
                        </div>

                    </form>
                    <table class="table align-middle mb-0 bg-white">
                        <thead class="bg-light">
                        <tr>
                            <th>Teacher's Name</th>
                            <th>Day</th>
                            <th>Time</th>

                        </tr>
                        </thead>
                        <tbody id="class-detail-table-body">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</section>

<%@include file="footer.jsp" %>

<script>
    getSubjectsForGrade();

    function getSubjectsForGrade() {
        $("#subject").empty();
        const grade = document.getElementById("grade").value;
        console.log(grade);
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

    function getClassDetails() {
        const grade = document.getElementById("grade").value;
        const subject = document.getElementById("subject").value;

        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/class/class-detail?grade=' + grade + '&subject=' + subject,
            dataType: 'json',
            success: function (result) {
                $("#class-detail-table-body").empty();
                result.map(value => {
                    $("#class-detail-table-body").append(
                        '<tr>' +
                        '<td>' + value.teachFirstName + ' ' + value.teachLastName + '</td>' +
                        '<td>' + value.day + '</td>' +
                        '<td>' + value.time + '</td>' +
                        '</tr>'
                    )
                })
            }
        });
    }


</script>


