<%@include file="header.jsp" %>
<%@include file="auth.jsp" %>
<%@include file="nav-bar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="class-page-section">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-5 ">
        <img src="<c:url value="/resources/assets/images/Confirmed-attendance-rafiki.svg"/>"
             class="img-fluid login-img class-img" alt="Sample image">

      </div>

      <div class=" col-md-6">
        <div class="shadow p-3 mb-5 bg-white rounded class-details-div">
          <p class="class-details-heading">
            Attendance
          </p>

          <form class="row row-cols-lg-auto g-3 align-items-center class-form-atten ">
            <div class="row mb-4">
              <div class="col">
                <label for="studentId" class="form-outline form-label">Student ID</label>
                <input id="studentId" class="form-control width-input-atten"
                       name="studentId" onchange="loadStudentClassData()">
              </div>


              <div class="col">
                <label for="studentName" class="form-outline form-label">Student Name</label>
                <input id="studentName" class="form-control width-input-atten"
                       name="studentName">
              </div>


              <div class="col">
                <label for="class" class="form-outline form-label">Class</label>
                <select id="class" class="form-select width-select-atten"
                        name="class">
                </select>
              </div>

              <div class="col">
                <button type="button" class="btn btn-primary  submit-btn-class" id="search-btn"
                        name="search-btn" onclick="loadAttendanceDetails()">Search
                </button>
              </div>
            </div>

          </form>
          <table class="table align-middle mb-0 bg-white">
            <thead class="bg-light">
            <tr>
              <th>Number</th>
              <th>Date</th>
              <th>Time</th>
            </tr>
            </thead>
            <tbody id="tableData" style="height:100px;overflow-y: auto">
            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>

</section>

<%@include file="footer.jsp" %>

<script>

  function loadStudentClassData() {

    const studentId = document.getElementById("studentId").value;
    const data = {
      "studentId": studentId
    };

    $.ajax({
      type: "POST",
      url: "functions/get-enrolled-subjects.php",
      dataType: "json",
      data: data,
      success: function (result) {
        if (result === "Invalid Student ID") {

        } else {
          document.getElementById("studentName").value = result.studentName;
          const classes = document.getElementById("class");
          classes.innerHTML = "";
          result.subjectArray.map(sub => {
            let option = document.createElement("option");
            option.setAttribute("value", sub.classId);
            option.innerText = sub.subjectName + " - " + sub.teacherFirstName + " " + sub.teacherLastName;
            classes.appendChild(option);
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

  function loadAttendanceDetails() {
    const studentId = document.getElementById("studentId").value;
    const classId = $("#class").val();

    const data = {
      "studentId": studentId,
      "classId": classId
    };

    $.ajax({
      type: "POST",
      url: "functions/get-attendance.php",
      dataType: "json",
      data: data,
      success: function (result) {
        let tableBody = document.getElementById("tableData");
        tableBody.innerHTML = "";
        result.map(data => {
          let tr = document.createElement("tr");

          let number = document.createElement("td");
          number.innerText = data.number + 1;
          tr.appendChild(number);

          let date = document.createElement("td");
          date.innerText = data.dateTime;
          tr.appendChild(date);

          let time = document.createElement("td");
          time.innerText = data.dateTime;
          tr.appendChild(time);

          tableBody.appendChild(tr);
        })
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
<?php require_once "includes/footer.php" ?>
