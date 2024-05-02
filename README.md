# Student Information System Database


This repository contains the HEXAWARE Assignment - 1 covering tasks 1 through 4 focused on SQL. It includes SQL schema definitions and queries designed for a Student Information System (SIS). 
The SIS database effectively manages crucial information pertaining to students, courses, enrollments, payments, and teachers.

## Tables

### Students
- Attributes: `student_id`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`

### Courses
- Attributes: `course_id`, `course_name`, `credits`, `teacher_id`

### Teacher
- Attributes: `teacher_id`, `first_name`, `last_name`, `email`

### Enrollments
- Attributes: `enrollment_id`, `student_id`, `course_id`, `enrollment_date`

### Payments
- Attributes: `payment_id`, `student_id`, `amount`, `payment_date`
