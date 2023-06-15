create database furuma_management;
use furuma_management;
CREATE TABLE job_position (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE literacy (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE accompanied_service (
    id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    price DOUBLE NOT NULL,
    unit VARCHAR(10) NOT NULL,
    status VARCHAR(45)
);
CREATE TABLE kind_of_customer (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE kind_of_service (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE kind_of_rent (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    birtday DATE NOT NULL,
    identity_number VARCHAR(45) NOT NULL,
    salary INT NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    id_job_position INT not null,
    id_literacy INT not null,
    id_department INT not null,
    FOREIGN KEY (id_job_position)
        REFERENCES job_position (id),
    FOREIGN KEY (id_literacy)
        REFERENCES literacy (id),
    FOREIGN KEY (id_department)
        REFERENCES department (id)
);
CREATE TABLE customer (
    id INT PRIMARY KEY,
    id_kind_of_customer INT not null,
    name VARCHAR(45) NOT NULL,
    birthday DATE NOT NULL,
    gender BIT NOT NULL,
    identity_number VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    foreign key (id_kind_of_customer) references kind_of_customer(id)
);
CREATE TABLE service (
    id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    use_area INT,
    costs DOUBLE NOT NULL,
    max_person INT,
    id_kind_of_rent INT not null,
    id_kind_of_service INT not null,
    room_standard VARCHAR(45),
    description VARCHAR(45),
    pool_area DOUBLE,
    number_of_floor INT,
    FOREIGN KEY (id_kind_of_rent)
        REFERENCES kind_of_rent (id),
    FOREIGN KEY (id_kind_of_service)
        REFERENCES kind_of_service (id)
);
CREATE TABLE contract (
    id INT PRIMARY KEY,
    date_contract DATETIME NOT NULL,
    date_end DATETIME NOT NULL,
    deposit DOUBLE NOT NULL,
    id_employee INT not null,
    id_customer INT not null,
    id_service INT not null,
    FOREIGN KEY (id_employee)
        REFERENCES employee (id),
    FOREIGN KEY (id_customer)
        REFERENCES customer (id),
    FOREIGN KEY (id_service)
        REFERENCES service (id)
);
CREATE TABLE contract_detail (
    id INT PRIMARY KEY,
    id_contract INT not null,
    id_accompanied_service INT not null,
    quantity INT NOT NULL,
    FOREIGN KEY (id_contract)
        REFERENCES contract (id),
    FOREIGN KEY (id_accompanied_service)
        REFERENCES accompanied_service (id)
);