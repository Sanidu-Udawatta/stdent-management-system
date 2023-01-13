<%--
  Created by IntelliJ IDEA.
  User: sanid
  Date: 1/1/2023
  Time: 2:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="WEB-INF/jsp/header.jsp" %>


<section class="vh-100" style="padding-top: 120px">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="<c:url value="resources/assets/images/Typing-bro.svg"/>"
                     class="img-fluid login-img" alt="Sample image">

            </div>
            <div class="vl col-md-1 col-lg-1 ">

            </div>

            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1" style="margin-left: 0 !important;">
                <form method="post" action="${pageContext.request.contextPath}/login/check">
                    <div class="d-flex flex-row align-items-center justify-content-center">
                        <p class="lead fw-normal mb-0 me-3 line-height "><span class="sinhala-name">isma fijK</span><br><span
                                class="admin-name">Admin Panel</span></p>

                    </div>


                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0"></p>
                    </div>

                    <div class="d-flex flex-row align-items-center justify-content-center">


                        <!-- Email input -->
                        <div class="form-outline mb-4 input-admin ">
                            <input type="text" id="form3Example3" class="form-control form-control-lg" name="username"
                                   placeholder=""/>
                            <label class="form-label" for="form3Example3">Username</label>
                        </div>
                    </div>
                    <!-- Password input -->
                    <div class="d-flex flex-row align-items-center justify-content-center">
                        <div class="form-outline mb-3 input-admin">
                            <input type="password" id="form3Example4" class="form-control form-control-lg"
                                   name="password"/>
                            <label class="form-label" for="form3Example4">Password</label>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->

                    </div>


                    <div class="text-center text-lg-start mt-4 pt-2 d-flex flex-row align-items-center justify-content-center">

                        <button type="submit" name="submit"
                                class="btn btn-primary btn-lg form-control login-btn  form-control-lg input-admin "
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">Login
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<%@include file="WEB-INF/jsp/footer.jsp" %>
