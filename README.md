# Clinic-Booking--system-Database

## Project Description

The **Clinic Booking System Database** is a relational database built using MySQL. It is designed to efficiently manage patient appointments, doctor assignments, payments, and departmental structures in a healthcare setting. This project demonstrates the core functionalities required to operate a small to medium-sized clinic, including patient registration, appointment scheduling, and financial tracking.

## Key Features

* Patient management with personal and contact details
* Doctor specialization and department assignments
* Flexible appointment scheduling and status tracking
* Secure and efficient payment management
* Departmental organization for doctors
* Audit logging for administrative actions

## Database Schema

The database includes the following key tables:

* **Patients** - Stores patient information
* **Doctors** - Stores doctor profiles and specialties
* **Appointments** - Manages patient appointments
* **Payments** - Tracks payment transactions
* **Departments** - Organizes medical departments
* **Doctor\_Department** - Links doctors to departments (many-to-many relationship)
* **Audit\_Logs** - Records user actions for security and auditing

## Database Setup

To set up the database, I followed this steps:

1. Clone the repository to my local machine.
2. Import the provided `Clinic-Booking-System.sql` file into my MySQL server:

   ```bash
   mysql -u <username> -p < database_name < Clinic-Booking-System.sql
   ```
3. Verify that the tables and relationships are created successfully.

## Entity-Relationship Diagram (ERD)

Include a screenshot of ERD created.


