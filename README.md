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
2.5 Constraints
Java Servlets/JSP for development.
PostgreSQL for database management.
Maven for project management.
3. Specific Requirements
3.1 Sign-Up System
Page: signup.jsp
Fields: Username, Password, Role (default: Employee).
Servlet: SignUpServlet.java
Adds users to the users table with the default role of "Employee."
Redirects to the login page upon success.
3.2 Login System
Page: login.jsp
Fields: Username, Password.
Servlet: LoginServlet.java
Validates credentials against the database.
Redirects users based on roles:
Employee: requestAccess.jsp
Manager: pendingRequests.jsp
Admin: createSoftware.jsp
3.3 Software Management (Admin Only)
Page: createSoftware.jsp
Fields: Name, Description, Access Levels.
Servlet: SoftwareServlet.java
Adds software to the software table.
3.4 Access Request System (Employee)
Page: requestAccess.jsp
Fields: Software Name, Access Type, Reason.
Servlet: RequestServlet.java
Records requests in the requests table with a "Pending" status.
3.5 Approval System (Manager)
Page: pendingRequests.jsp
Displays pending requests with options to approve/reject.
Servlet: ApprovalServlet.java
Updates the status of requests in the requests table.
4. Data Requirements
4.1 Database Design
1. users Table
Columns: id, username, password, role.
2. software Table
Columns: id, name, description, access_levels.
3. requests Table
Columns: id, user_id, software_id, access_type, reason, status.
5. Deliverables
Source Code
Java Servlets: SignUpServlet.java, LoginServlet.java, SoftwareServlet.java, RequestServlet.java, ApprovalServlet.java.
JSP Pages: signup.jsp, login.jsp, createSoftware.jsp, requestAccess.jsp, pendingRequests.jsp.
Database Scripts
SQL for creating and populating users, software, and requests tables.
Documentation
README with setup and usage instructions.
6. Evaluation Criteria
Functionality: Full workflow support for Employees, Managers, and Admins.
Code Structure: Organized servlets and JSPs.
Database Handling: Correct data processing.
Completeness: Implementation of all features as specified.
7. Roles Summary
Role	Responsibilities	Restrictions
Employee	Request access	Cannot create software or approve requests.
Manager	Approve requests	Cannot request access or create software.
Admin	Full control	None
