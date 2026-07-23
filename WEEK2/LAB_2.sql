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

SELECT DISTINCT UPPER(full_name) AS full_name FROM citizen;
SELECT  DISTINCT LOWER(village_name) AS village_name FROM citizen;
SELECT  DISTINCT full_name, LENGTH(full_name) AS name_length FROM citizen;
SELECT  DISTINCT CONCAT(UPPER(full_name),'   ',LOWER(village_name)) AS canacatenation FROM citizen;
SELECT DISTINCT SUBSTRING_INDEX(full_name,' ',1) as first_name FROM citizen;
SELECT CONCAT('Citizen: ',full_name,' \n  Village: ',village_name) AS Both_of FROM citizen;



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
(3,'death record request','request for a locally maintained birth record',5,23.34,TRUE),
(4,'Family Member Certificate','Record declare family member info',10,55.80,TRUE),
(5,'property Certificate','Certificates related to locally maintained property records',15,57.98,TRUE),
(6,'No_Dues Certificate','Indicates applicable local dues status',7,25.00,FALSE);
UPDATE certificate_type SET application_fee=23.24 WHERE certificate_type_id=3;

SELECT ROUND(application_fee) AS round_figure FROM certificate_type;


SELECT POWER(processing_days,2) AS SQUARE FROM certificate_type;
SELECT processing_days, ABS(processing_days - 10) AS absolutevalue FROM certificate_type;
SELECT MOD(processing_days,3) AS REMAINDERS FROM certificate_type;
SELECT ROUND(application_fee,1) AS round_onedecimal FROM certificate_type;
SELECT FLOOR(SQRT(processing_days)) AS SQUAREROOT FROM certificate_type;
SELECT FLOOR(RAND() * 100) AS random_rrr;
SELECT certification_name, (processing_days*2) AS MULTIPLICATION FROM certificate_type;
SELECT application_fee,CEIL(application_fee) AS ceiling_value,FLOOR(application_fee) AS floor_value FROM certificate_type;





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

SELECT reference_number,SUBSTRING(reference_number,1,4) AS FIRST_4_LETTERS FROM certificate_application;
SELECT distinct REPLACE(certificate_name,'Certificate','Cert.') AS replace_cert FROM certificate_application;
SELECT TRIM(certificate_name) AS TRIMMED FROM certificate_application;
SELECT * FROM certificate_application WHERE reference_number LIKE 'GP2026%';
SELECT * FROM certificate_application;

-- DATE FUNCTIONS

SELECT CURDATE();
SELECT NOW();
SELECT application_date,YEAR(application_date) AS YEAR FROM certificate_application;
SELECT application_date,MONTH(application_date) AS MONTH FROM certificate_application;
SELECT application_date,DAY(application_date) AS DAY FROM certificate_application;
SELECT application_date,DATE_ADD(application_date,INTERVAL 30 DAY) AS After_30days FROM certificate_application;
SELECT application_date,DATE_SUB(application_date,INTERVAL 7 DAY) AS SUB_7days FROM certificate_application;
SELECT  DISTINCT application_date,DATEDIFF(CURDATE(),application_date) AS days_passed FROM certificate_application;
SELECT * FROM certificate_application WHERE YEAR(application_date)=YEAR(CURDATE());

-- CONVERSION FUNCTIONS
SELECT CAST(application_fee AS SIGNED) AS integer_s FROM certificate_type;
SELECT CAST(processing_days AS CHAR) AS Days_char FROM certificate_type;
SELECT CAST(application_fee AS DATETIME) AS appli_datetime FROM certificate_type;
SELECT CAST(processing_days AS DECIMAL(8,2)) AS days_decimal FROM certificate_type;
SELECT CAST(application_fee AS CHAR) AS appli_chara FROM certificate_type;
SELECT CAST(application_fee AS SIGNED)+10 AS total_fee FROM certificate_type;



  






  

