DROP TABLE IF EXISTS pet_store_customer;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS pet_store;

CREATE TABLE pet_store (
	pet_store_id INT NOT NULL AUTO_INCREMENT,
	pet_store_name VARCHAR(128),
	pet_store_address VARCHAR(128),
	pet_store_city VARCHAR(128),
	pet_store_state VARCHAR(128),
	pet_store_zip VARCHAR(128),
	pet_store_phone VARCHAR(128),
	PRIMARY KEY (pet_store_id)
);

CREATE TABLE employee (
	employee_id INT NOT NULL AUTO_INCREMENT,
	pet_store_id INT NOT NULL,
	employee_first_name VARCHAR(128),
	employee_last_name VARCHAR(128),
	employee_phone VARCHAR(128),
	employee_job_title VARCHAR(128),
	PRIMARY KEY (employee_id),
	FOREIGN KEY (pet_store_id) REFERENCES pet_store(pet_store_id) ON DELETE CASCADE
);

CREATE TABLE customer (
	customer_id INT NOT NULL AUTO_INCREMENT,
	customer_first_name VARCHAR(128),
	customer_last_name VARCHAR(128),
	customer_email VARCHAR(128),
	PRIMARY KEY (customer_id)
);

CREATE TABLE pet_store_customer (
	customer_id INT NOT NULL,
	pet_store_id INT NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
	FOREIGN KEY (pet_store_id) REFERENCES pet_store(pet_store_id) ON DELETE CASCADE,
	UNIQUE (customer_id, pet_store_id)
);