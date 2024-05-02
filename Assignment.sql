-- Student Information System
/*Task 1. Database Design:
--1. Create the database named "SISDB" */
-- create Student Information System (SIS) database.
CREATE DATABASE SISDB
use SISDB
/* 2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data
types, constraints, and relationships. 
a. Students
b. Courses
c. Enrollments
d. Teacher
e. Payments */

-- creating student table 
CREATE TABLE Students (
  student_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone_number bigint
);

-- creating Courses Table 
CREATE TABLE Courses (
  course_id INT PRIMARY KEY IDENTITY(1,1),
  course_name VARCHAR(100) NOT NULL,
  credits INT NOT NULL,
  teacher_id INT NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- creating Teacher Table 
CREATE TABLE Teacher (
  teacher_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
)

-- creating Enrollments Table 
CREATE TABLE Enrollments (
  enrollment_id INT PRIMARY KEY IDENTITY(1,1),
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

alter table Enrollments
add constraint Enrollments_studentid_fk
FOREIGN KEY (student_id) REFERENCES Students(student_id) on delete cascade;

-- creating Payments Table 
CREATE TABLE Payments (
  payment_id INT PRIMARY KEY IDENTITY(1,1),
  student_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

alter table payments
add constraint payments_studentid_fk
FOREIGN KEY (student_id) REFERENCES Students(student_id) on delete cascade;

/*3. Create an ERD (Entity Relationship Diagram) for the database.
 Created 
4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
--created
5. Insert at least 10 sample records into each of the following tables. */

--Insert into Students
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('Aisha', 'Kapoor', '2000-08-15', 'aisha.kapoor@gmail.com', 9988776655),
       ('Rohan', 'Singh', '1998-06-21', 'rohan.singh@gmail.com', 9855443322),
       ('Priya', 'Desai', '1995-12-09', 'priya.desai@gmail.com', 9744332211),
       ('Rahul', 'Sharma', '2002-03-04', 'rahul.sharma@gmail.com', 9633221100),
       ('Diya', 'Mehta', '1997-09-27', 'diya.mehta@gmail.com', 9522110099),
       ('Arjun', 'Patel', '2001-01-10', 'arjun.patel@gmail.com', 9411009988),
       ('Riya', 'Gupta', '1999-04-18', 'riya.gupta@gmail.com', 9300998877),
       ('Aman', 'Kumar', '1996-10-25', 'aman.kumar@gmail.com', 9299887766),
       ('Sita', 'Das', '2003-07-07', 'sita.das@gmail.com', 9188776655),
       ('Vikram', 'Bose', '1998-02-02', 'vikram.bose@gmail.com', 9077665544);

--Insert into Courses
INSERT INTO Courses (course_name, credits, teacher_id)
VALUES ('Computer Network', 3, 1),
       ('Data Structures and Algorithms', 4, 2),
       ('Mathematics', 4, 3),
       ('Blockchain', 3, 4),
       ('Web Development Fundamentals', 3, 5),
       ('Cloud Computing', 3, 6),
       ('Artificial Intelligence', 3, 7),
       ('Soft Computing', 3, 8),
       ('Machine Learning', 2, 9),
       ('Mobile App Development', 3, 10);


--Insert into Teacher
INSERT INTO Teacher (first_name, last_name, email)
VALUES ('Sunita', 'Verma', 'sunita.verma@university.com'),
       ('Ravi', 'Patel', 'ravi.patel@university.com'),
       ('Anjali', 'Mukherjee', 'anjali.mukherjee@university.com'),
       ('Aditya', 'Rao', 'aditya.rao@university.com'),
       ('Priyanka', 'Chopra', 'priyanka.chopra@university.com'),
       ('Akash', 'Kapoor', 'akash.kapoor@university.com'),
       ('Meera', 'Joshi', 'meera.joshi@university.com'),
       ('Sonia', 'Khan', 'sonia.khan@university.com'),
       ('Rishi', 'Mehta', 'rishi.mehta@university.com'),
       ('Dev', 'Shah', 'dev.shah@university.com');

--Insert into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 11, '2024-04-15'), 
       (2, 12, '2024-03-15'),  
       (3, 3, '2024-02-15'), 
       (4, 4, '2024-01-15'),  
       (5, 5, '2024-01-20'),    
       (6, 6, '2024-01-18'), 
       (7, 7, '2024-02-22'),  
       (8, 8, '2024-04-10'),  
       (9, 9, '2024-03-15'),
	   (10, 10, '2024-03-30');  

--Insert into Payments
INSERT INTO Payments (student_id, amount, payment_date)
VALUES (1, 500.00, '2024-01-10'),  -- Aisha Kapoor (partial payment)
       (2, 1200.00, '2024-01-20'),  -- Rohan Singh (full payment)
       (3, 800.00, '2024-01-12'),  -- Priya Desai (partial payment)
       (4, 750.00, '2024-01-25'),  -- Rahul Sharma (full payment)
       (5, 600.00, '2024-01-18'),  -- Diya Mehta (partial payment)
       (1, 400.00, '2024-02-14'),  -- Aisha Kapoor (remaining payment)
       (3, 400.00, '2024-02-05'),  -- Priya Desai (remaining payment)
       (5, 300.00, '2024-02-20'),  -- Diya Mehta (remaining payment)
       (7, 900.00, '2024-01-28'),  -- Riya Gupta (full payment)
       (8, 650.00, '2024-01-15');  -- Aman Kumar (full payment)

                                                
												--Task 2:-


/*Select, Where, Between, AND, LIKE:
1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890 */
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', 1234567890)

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
--insert a record into the "Enrollments" table with the enrollment date.
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 4, '2024-04-15');


--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
--modify their email address.
update Teacher
set Teacher.email='dev_shah@university.com'
where Teacher.last_name='Shah'
 

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
--an enrollment record based on the student and course.
delete from Enrollments 
where course_id=9 and student_id=9

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
--teacher from the respective tables.
update Courses
set teacher_id=1 
where course_id=12

--6. Delete a specific student from the "Students" table and remove all their enrollment records
--from the "Enrollments" table. Be sure to maintain referential integrity.
delete from Students
where student_id=10

--All records were removed automatically from the Enrollments table because of the ON DELETE CASCADE constraint


--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
--payment record and modify the payment amount.
update Payments
set amount= 750
where payment_id=8



                                           --Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

--1.Write an SQL query to calculate the total payments made by a specific student. You will need to
--join the "Payments" table with the "Students" table based on the student's ID.
select s.student_id, sum(amount) as [Total Payments]
from Students s inner join Payments p
on s.student_id=p.student_id
group by s.student_id
order by s.student_id

--2.Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
select c.course_name,count(e.course_id) as [Students Enrolled]
from Courses c left join Enrollments e
on c.course_id=e.course_id
group by c.course_name,c.course_id

--3.Write an SQL query to find the names of students who have not enrolled in any course. Use a
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
--without enrollments.
select CONCAT_WS(' ',s.first_name, s.last_name) as  [Name]
from Students s left join Enrollments e
on s.student_id=e.student_id
where e.student_id is null

--4.Write an SQL query to retrieve the first name, last name of students, and the names of the
--courses they are enrolled in. Use JOIN operations between the "Students" table and the
--"Enrollments" and "Courses" tables.
select s.first_name as  [First Name],s.last_name as [Last Name] , c.course_name as [Course Name]
from Students s left join Enrollments e on s.student_id=e.student_id
left join Courses c on e.course_id=c.course_id

--5.Create a query to list the names of teachers and the courses they are assigned to. Join the
--"Teacher" table with the "Courses" table.
select t.first_name,c.course_name
from Teacher t left join Courses c
on t.teacher_id=c.teacher_id

--6.Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
--"Students" table with the "Enrollments" and "Courses" tables
select CONCAT_WS(' ',s.first_name, s.last_name) as  [Name],c.course_name as [Course Name],e.enrollment_date as [Enrollment Date]
from Students s left join Enrollments e 
on s.student_id=e.student_id left join Courses c on e.course_id=c.course_id

--7.Find the names of students who have not made any payments. Use a LEFT JOIN between the
--"Students" table and the "Payments" table and filter for students with NULL payment records.
select CONCAT_WS(' ',s.first_name, s.last_name) as  [Name]
from Students s left join Payments p
on s.student_id = p.student_id
where p.payment_id is NULL

--8.Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL
--enrollment records.
select c.course_name
from Courses c left join Enrollments e
on c.course_id=e.course_id
where e.enrollment_id is NULL

--9.Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
--table to find students with multiple enrollment records
 select distinct e1.student_id
 from Enrollments e1
 join Enrollments e2 on e1.student_id=e2.student_id
 where e1.course_id<>e2.course_id
  select *from Enrollments


--10.Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
--table and the "Courses" table and filter for teachers with NULL course assignments.
select CONCAT_WS(' ',t.first_name,t.last_name) as [Name]
from Teacher t left join Courses c
on t.teacher_id=c.teacher_id
where c.course_id is null  



                                             --Task4--

--1.Write an SQL query to calculate the average number of students enrolled in each course. Use
--aggregate functions and subqueries to achieve this.


SELECT 
    course_name,
    (
        SELECT AVG(student_count)
        FROM (
            SELECT COUNT(student_id) AS student_count
            FROM Enrollments
            WHERE course_id = Courses.course_id
            GROUP BY course_id
        ) AS subquery
    ) AS avg_students_enrolled
FROM Courses;



--2.Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount.
select student_id
from Payments where amount in
(select max(amount)
from Payments)


--3.Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
--course(s) with the maximum enrollment count
SELECT c.course_name, COUNT(e.enrollment_id) AS course_enrollment_count
FROM Courses c
INNER JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.enrollment_id) = (
  SELECT MAX(student_count)
  FROM (
    SELECT course_id, COUNT(*) AS student_count
    FROM Enrollments
    GROUP BY course_id
  ) AS subquery
);


--4.Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
--payments for each teacher's courses

--using subquerry
SELECT CONCAT_WS(' ',t.first_name,t.last_name) AS teacher_name, 
       (SELECT SUM(amount)
        FROM Payments AS p2
        WHERE p2.student_id IN (
          SELECT student_id
          FROM Enrollments AS e2
          WHERE e2.course_id IN (
            SELECT course_id
            FROM Courses AS c2
            WHERE c2.teacher_id = t.teacher_id
          )
        )
       ) AS total_payments
FROM Teacher AS t;

--using joins
SELECT CONCAT_WS(' ',t.first_name,t.last_name) AS teacher_name, 
       SUM(p.amount) AS total_payments
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
LEFT JOIN Enrollments e ON c.course_id = e.course_id
LEFT JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;

--5.Identify students who are enrolled in all available courses. Use subqueries to compare a
--student's enrollments with the total number of courses
select distinct student_id
from Enrollments
where (
    select COUNT(distinct course_id)
    from Courses
) = (
    select COUNT(distinct course_id)
    from Enrollments AS e
    where e.student_id = Enrollments.student_id
)

SELECT student_id, CONCAT_WS(' ',first_name, last_name) as [Name]
FROM students s
WHERE (SELECT COUNT(*) FROM enrollments e WHERE e.student_id = s.student_id) = 
  (SELECT COUNT(*) FROM courses);

--6.Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
--find teachers with no course assignments.
select teacher_id, first_name, last_name
from Teacher where teacher_id not in (select distinct teacher_id from Courses)

--7.Calculate the average age of all students. Use subqueries to calculate the age of each student
--based on their date of birth.
select avg (age) as [Average age]
from (select DATEDIFF(year,date_of_birth,GETDATE()) as age
from Students ) as students

--8.Identify courses with no enrollments. Use subqueries to find courses without enrollment
--records.
select course_name ,course_id
from Courses where course_id not in (select distinct course_id from Enrollments)

--9.Calculate the total payments made by each student for each course they are enrolled in. Use
--subqueries and aggregate functions to sum payments.

select student_id, course_id,
    (
        select SUM(amount)
        from Payments
        where student_id = Enrollments.student_id
        AND course_id = Enrollments.course_id
    ) AS [Total Payments]
from Enrollments


SELECT concat(s.first_name,' ',s.last_name) as student_name,course_name, total_payment
FROM Students s
LEFT JOIN (
  SELECT e.student_id, e.course_id, SUM(amount) AS total_payment
  FROM Enrollments e
  LEFT JOIN Payments p ON e.student_id = p.student_id
  GROUP BY e.student_id, e.course_id
) AS course_payments
ON s.student_id = course_payments.student_id
LEFT JOIN Courses c ON course_payments.course_id = c.course_id;


--10.Identify students who have made more than one payment. Use subqueries and aggregate
--functions to count payments per student and filter for those with counts greater than one.
select distinct student_id
from Payments
where (
    select COUNT(*)
    from Payments AS p
    where p.student_id = Payments.student_id
) > 1



--11.Write an SQL query to calculate the total payments made by each student. Join the "Students"
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
--student.
select s.student_id, sum(amount)
from Students s left join Payments p
on s.student_id = p.student_id
group by s.student_id


--12.Retrieve a list of course names along with the count of students enrolled in each course. Use
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
--count enrollments
select c.course_name, count(e.student_id) as [Total students enrolled]
from Courses c left join Enrollments e
on c.course_id=e.course_id
group by c.course_name


--13.Calculate the average payment amount made by students. Use JOIN operations between the
--"Students" table and the "Payments" table and GROUP BY to calculate the average.
select s.student_id, avg(amount) as [Average payment]
from Students s left join Payments p
on s.student_id=p.student_id
group by s.student_id












