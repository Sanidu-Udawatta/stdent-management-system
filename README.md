StudentManagementSystem
Student Management System form SipSewana Institute

#SQL Query
----------------------------------------------------------------------------------

drop database StudentManagementSystem;

create database StudentManagementSystem;

use StudentManagementSystem;

create table admin( id double NOT NULL Auto_INCREMENT, username varchar(20) NOT NULL, password varchar(15) NOT NULL, PRIMARY KEY(id) );

insert into admin (username, password) values('admin', 'admin' );

create table subject( name varchar(20) NOT NULL, PRIMARY KEY(name) );

create table grade( name varchar(10) NOT NULL, PRIMARY KEY(name) );

create table teacher ( id double NOT NULL, firstName varchar(20) NOT NULL, lastName varchar(20) NOT NULL, gender varchar(6) NOT NULL, address varchar(50) NOT NULL, contactNo varchar(50) NOT NULL, PRIMARY KEY(id) );

create table class( id double NOT NULL Auto_INCREMENT, day varchar(10), time varchar(10), subjectName varchar(20), gradeName varchar(10), teacherId double, datetime datetime, PRIMARY KEY (id), FOREIGN KEY (subjectName) REFERENCES subject(name), FOREIGN KEY (gradeName) REFERENCES grade(name), FOREIGN KEY (teacherId) REFERENCES teacher(id) );

create table student ( id double NOT NULL, firstName varchar(20) NOT NULL, lastName varchar(20) NOT NULL, gender varchar(6) NOT NULL, grade varchar(10) NOT NULL, school varchar(50) NOT NULL, dob varchar(20) NOT NULL, address varchar(50) NOT NULL, guardianName varchar(30) NOT NULL, guardianContactNo char(10) NOT NULL, PRIMARY KEY(id) );

create table class_student_enrollment( id double NOT NULL Auto_INCREMENT, datetime datetime NOT NULL, studentId double NOT NULL, classId double NOT NULL, PRIMARY KEY (id), FOREIGN KEY (studentId) REFERENCES student(id), FOREIGN KEY (classId) REFERENCES class(id) );

create table attendance(
id double NOT NULL Auto_INCREMENT,
datetime datetime,
enrollmentId double,
PRIMARY KEY (id),
FOREIGN KEY (enrollmentId) REFERENCES class_student_enrollment(id)
);
create table payment( id double NOT NULL Auto_INCREMENT, month int(2), fee decimal(11,2), date_time datetime, enrollment_id double, PRIMARY KEY (id), FOREIGN KEY (enrollment_id) REFERENCES class_student_enrollment(id) );

insert into subject (name) values('Maths'); insert into subject (name) values('Science'); insert into subject (name) values('English'); insert into subject (name) values('History'); insert into subject (name) values('Sinhala'); insert into subject (name) values('ICT'); insert into subject (name) values('Commerce');

insert into grade (name) values('Grade 6'); insert into grade (name) values('Grade 7'); insert into grade (name) values('Grade 8'); insert into grade (name) values('Grade 9'); insert into grade (name) values('Grade 10'); insert into grade (name) values('Grade 11');
