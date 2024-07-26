 CREATE DATABASE TAMS_second;
USE TAMS_second;
DROP DATABASE TAMS_second;
--USER table-only one user, admin (id, username, password, name)

CREATE TABLE user_details(
	user_id INT IDENTITY PRIMARY KEY,
	user_name VARCHAR(50)
);
------------------------------------------------------COURSE MANAGEMENT----------------------------------------------------------------------
CREATE TABLE course(
	course_code INT IDENTITY(1000, 1) PRIMARY KEY,
	course_name VARCHAR(50),
	description VARCHAR(100),
	duration INT,
	fees INT
);

CREATE TABLE qualification(
	qualification_id INT IDENTITY(1,1) PRIMARY KEY,
	course_code INT,
	qualification VARCHAR(50),
	FOREIGN KEY(course_code) REFERENCES course(course_code)
);

CREATE TABLE course_module(
	module_id INT IDENTITY(1,1) PRIMARY KEY,
	course_code INT,
	course_module VARCHAR(50),
	FOREIGN KEY(course_code) REFERENCES course(course_code)
);

/*CREATE TABLE course_qualification_link(
	course_code INT,
	qualification_id INT,
	PRIMARY KEY(course_code, qualification_id),
	FOREIGN KEY(course_code) REFERENCES course(course_code),
	FOREIGN KEY(qualification_id) REFERENCES qualification(qualification_id)
);*/

/*CREATE TABLE course_module_link(
	course_code INT,
	module_id INT,
	PRIMARY KEY(course_code, module_id),
	FOREIGN KEY(module_id) REFERENCES course_module(module_id),
	FOREIGN KEY(course_code) REFERENCES course(course_code)
);*/
-----------------------------------------------COURSE ENQUIRY MANAGEMENT---------------------------------------------------------

CREATE TABLE enquiry_status_update(
	status_id INT IDENTITY(1, 1) PRIMARY KEY,
	current_status VARCHAR(50) NOT NULL
);

CREATE TABLE enquirer_details(
	enquirer_id INT IDENTITY(1, 1) PRIMARY KEY,
	enquirer_name VARCHAR(50),
	dob DATE,
	email VARCHAR(50),
	phone INT,
	address VARCHAR(50),
	highest_quali VARCHAR(50),
	percentage_marks DECIMAL(3, 2),
	year_passout INT,
	resource_name VARCHAR(50)
);


CREATE TABLE enquiry(
	enquiry_id INT PRIMARY KEY,
	enquirer_id INT,
	enquired_course INT,
	enquiry_date DATE,
	enquiry_status INT,
	FOREIGN KEY(enquirer_id) REFERENCES enquirer_details(enquirer_id),
	FOREIGN KEY(enquired_course) REFERENCES course(course_code),
	FOREIGN KEY(enquiry_status) REFERENCES enquiry_status_update(status_id)
);