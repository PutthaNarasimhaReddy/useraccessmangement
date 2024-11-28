# useraccessmangement
1. Introduction

1.1 Purpose
The system facilitates secure and efficient user access to software applications through roles such as Employees, Managers, and Admins, with defined permissions for each.

1.2 Scope

Key features include:

Sign-Up: User account creation.
Login: Role-based authentication.
Software Management: Admin-only feature for software listing/creation.
Access Requests: Employees can request access to software.
Approvals: Managers handle access requests (approve/reject).


2. Overall Description

2.1 Product Perspective

A web-based internal tool to streamline user access management.

2.2 Product Functions

User roles: Employee, Manager, Admin.
Core actions for each role:
Employee: Sign up, log in, request software access.
Manager: Log in, view and act on pending access requests.
Admin: Create software applications, manage system settings.

2.3 User Classes

Employee: Restricted to requesting access.
Manager: Reviews and approves/rejects requests.
Admin: Full control, including software creation.

2.4 Operating Environment

Backend: Java Servlet Container (e.g., Tomcat).
Frontend: HTML/CSS/JavaScript.
Database: PostgreSQL.


3. Roles Summary
Role	Responsibilities	Restrictions
Employee	Request access	Cannot create software or approve requests.
Manager	Approve requests	Cannot request access or create software.
Admin	Full control	None
