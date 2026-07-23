DROP DATABASE gram;
CREATE DATABASE gram;
USE gram;

CREATE TABLE citizen
( citizen_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(15) UNIQUE,
  occupation VARCHAR(50),
  village_name VARCHAR(50) NOT NULL,
  is_active BOOLEAN NOT NULL
);
INSERT INTO citizen VALUES
(101,'RAVI','1995-06-15','MALE','9876500001','FARMER','RAMAPURAM',TRUE),
(102,'LAKSHMI DEVI','1988-11-22','FEMALE','987650002','TAILOR','RAMAPURAM',TRUE),
(103,'SURESH BABU','1992-03-10','MALE','987650003','SHOPKEEPER','SEETHAPURAM',TRUE),
(104,'ANJALI RAO','2000-08-05','FEMALE','987650004','STUDENT','RAMAPURAM',TRUE),
(105,'KIRAN KUMAR','1985-01-18','MALE','987650005','ELECTRIAN','SEETHAPURAM',TRUE),
(106,'MEENA KUMARI','1988-12-30','FEMALE','987650006','TEACHER','LAKSHMIPURAM',FALSE);

INSERT INTO citizen VALUES (107,'KANYA KUMARI','1999-07-05','FEMALE','9876500007','ARTIST','SEETHAMMAPETA',TRUE);

UPDATE citizen SET occupation='Electrical Techician' WHERE citizen_id=105;

DELETE FROM citizen WHERE citizen_id=107;

ALTER TABLE citizen ADD COLUMN ADDRESS VARCHAR(10);

INSERT INTO citizen VALUES
(101,'RAVI','1995-06-15','MALE','9876500001','FARMER','RAMAPURAM',TRUE,'GANDULUR');

INSERT INTO citizen VALUES
(108,'RAVI','1995-06-15','MALE','9876500001','FARMER','RAMAPURAM',TRUE,'GANDULUR');
SELECT * FROM citizen;


CREATE TABLE certificate_type
( certificate_type_id INT PRIMARY KEY,
  certification_name VARCHAR(100) UNIQUE,
  descriptive VARCHAR(100) NOT NULL,
  processing_days INT NOT NULL,
  application_fee DECIMAL(8,2) NOT NULL,
  is_alive BOOLEAN NOT NULL
);
INSERT INTO certificate_type VALUES
(1,'Residence Certificate','Certificates the declared place of residence',7,30.00,TRUE),
(2,'Birth Record request','request for a locally maintained birth record',5,20.00,TRUE),
(3,'death record request','request for a locally maintained birth record',5,20.00,TRUE),
(4,'Family Member Certificate','Record declare family member info',10,40.00,TRUE),
(5,'property Certificate','Certificates related to locally maintained property records',15,50.00,TRUE),
(6,'No_Dues Certificate','Indicates applicable local dues status',7,25.00,FALSE);

INSERT INTO certificate_type VALUES(7,'INCOME Certificate','Certificate related to income',8,35.00,TRUE);

UPDATE certificate_type SET  processing_days=12 WHERE certification_name='property Certificate';

INSERT INTO certificate_type VALUES
(7,'Certificates the declared place of residence',7,30.00,TRUE);



SELECT * FROM certificate_type;


CREATE TABLE certificate_application
( application_id INT PRIMARY KEY,
  citizen_id INT NOT NULL,
  certificate_name VARCHAR(100) NOT NULL,
  application_date DATE NOT NULL,
  purpose VARCHAR(100) NOT NULL,
  application_status VARCHAR(100) NOT NULL,
  fee_paid DECIMAL(8,2) NOT NULL,
  reference_number VARCHAR(30) UNIQUE
);
INSERT INTO certificate_application VALUES
(1001,101,'Residence Certificate','2026-07-01','Bank account documentation','submitted',30.00,'GP20260001'),
(1002,102,'Family Member Certificate','2026-07-02','Welfare scheme application','under review',40.00,'GP20260002'),
(1003,103,'Proprety Certificate','2026-07-03','property documentation','submitted',50.00,'GP20260003'),
(1004,104,'Residence Certificate','2026-07-04','college admission','approved',30.00,'GP20260004'),
(1005,105,'No-Due Certificate','2026-07-05','Local service requirement','under review',25.00,'GP20260005'),
(1006,106,'Birth Record Request','2026-07-06','personal documentation','rejected',20.00,'GP20260006');

UPDATE certificate_application SET application_status='Under Review' WHERE application_id=1001;

UPDATE certificate_application SET application_status='Approved' WHERE application_id=1002;

ALTER TABLE certificate_application ADD COLUMN issued_date DATE;
INSERT INTO certificate_application VALUES
(1007,107,'Residence Certificate','2026-07-01','Bank account documentation','submitted',30.00,'GP20260007','2027-07-16');

ALTER TABLE certificate_application MODIFY COLUMN  purpose VARCHAR(200);

INSERT INTO certificate_application VALUES
(1008,108,'Residence Certificate','2026-07-01','Bank account documentation','submitted',30.00,'GP20260007','2027-07-16');

SELECT * FROM certificate_application;

CREATE TABLE panchayat_office
( office_id INT PRIMARY KEY,
  office_name VARCHAR(100) NOT NULL,
  village VARCHAR(50) NOT NULL,
  pincode VARCHAR(15) NOT NULL,
  conc  VARCHAR(15) UNIQUE,
  office_mail  VARCHAR(100) UNIQUE,
  is_alive BOOLEAN NOT NULL
);
INSERT INTO panchayat_office VALUES
(1,'RAMPURAM PANCHAYAT','RAMAPURAM','521101','0866000001','ramapuram@gp.example',TRUE),
(2,'SEETHAMPETA PANCHAYAT','SEETHAMPETA','521102','0866000002','seethamram@gp.example',TRUE),
(3,'LAKSHIMPURAM PANCHAYAT','LAKSHIMPURAM','521103','0866000003','lakshmipuram@gp.example',TRUE),
(4,'KRISHNAPURAM PANCHAYAT','KRISHNAPURAM','521104','0866000004','krishanpuram@gp.example',TRUE),
(5,'VENKATAPURAM PANCHAYAT','VENKATAPURAM','521105','0866000005','venkatapuram@gp.example',TRUE),
(6,'GOPALAPURAM PANCHAYAT','GOPALAPURAM','521106','08660000016','gopalapuram@gp.example',FALSE);

ALTER TABLE panchayat_office ADD COLUMN closing_time TIME;

UPDATE panchayat_office SET village="GANDULUR" WHERE office_id=4;
DELETE FROM spanchayat_office WHERE office_id=5;
ALTER TABLE panchayat_office RENAME COLUMN conc to phonenumber;
ALTER TABLE panchayat_office ADD COLUMN STREET VARCHAR(10);
INSERT INTO panchayat_office VALUES(7,'KHAJI PANCHAYAT','KHAJI','567','097324','khaji@gp',FALSE,'RAGHAV');
SELECT * FROM panchayat_office;

CREATE TABLE temporary_request
( request_id INT PRIMARY KEY,
  request_name VARCHAR(100) NOT NULL,
  requset_date DATE
  );
INSERT INTO temporary_request VALUES
(10001,'RAM',"2020-07-07"),
(10002,'RAJI',"2021-08-17"),
(10003,'RAM',"2022-12-27");

SELECT * FROM temporary_request;
TRUNCATE TABLE temporary_request;
SHOW TABLES;
DROP TABLE temporary_request;






  






  

