CREATE Database Blood_Bank;
USE Blood_Bank;
-- insted of double click
CREATE TABLE DONOR
(
    donSSN INT(10) NOT NULL,
    NameD VARCHAR(40),
    HealthCond VARCHAR(10),
    City VARCHAR(20),
    Street VARCHAR(20),
    Gender CHAR(1) CHECK (Gender IN ('F', '')),
    DateOfBirth DATE,
    LatestDonationDate DATE,
    NoPrevDonations INT(4),
    CONSTRAINT DONOR_PK PRIMARY KEY (donSSN)
);

CREATE TABLE DONOR_PHONES
(
    donSSN INT(10) NOT NULL,
    phoneNO INT (10) NOT NULL,
    CONSTRAINT DONOR_PHONES_FK1 FOREIGN KEY (donSSN) REFERENCES DONOR (donSSN) ON DELETE CASCADE,
    CONSTRAINT DONOR_PHONES_PK PRIMARY KEY (donSSN,phoneNO)
);
CREATE TABLE EMPLOYEE
(
    EmployeeID INT (10) NOT NULL,
    EmployeeName VARCHAR(40),
    Nationality VARCHAR(20),
    EmployeePosition VARCHAR(20),
    EmployeeSSN INT(5) UNIQUE,
    Gender CHAR(1) CHECK (Gender IN ('F', 'M')),
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EmployeeID)
);
CREATE TABLE BLOOD_STOCK
(
    StockID INT(10) NOT NULL,
    BloodType VARCHAR(3) CHECK (Blood_Type IN ('A+', 'A', 'B+', 'B-', 'AB+', 'AB-', '0', '-')),
    Quantity INT (5),
    ManagerID INT (10) UNIQUE,
    CONSTRAINT BLOOD_STOCK_PK PRIMARY KEY (StockID),
    CONSTRAINT BLOOD_STOCK_FK1 FOREIGN KEY (ManagerID) REFERENCES EMPLOYEE (EmployeeID) ON DELETE SET NULL
);

CREATE TABLE REQUEST
(
    RequestNumber INT(10) NOT NULL,
    DateOfRequest DATE,
    RequestStatus VARCHAR(20),
    details VARCHAR(100),
    CONSTRAINT REQUEST_PE PRIMARY KEY (RequestNumber)
);
CREATE TABLE REQUEST_BLOOD_TYPE
(
    RequestNumber INT(10) NOT NULL,
    RequiredBloodType VARCHAR(3) NOT NULL CHECK (RequiredBloodType IN ('A+', 'A', 'B+', 'B-', 'AB+', 'AB-', '0', '-')),
    RequiredBloodQuantity INT(5),
    CONSTRAINT REQUEST_BLOOD_TYPES_FKI FOREIGN KEY (RequestNumber) REFERENCES REQUEST (RequestNumber) ON DELETE CASCADE,
    CONSTRAINT REQUEST_BLOOD_TYPES_PK PRIMARY KEY (RequestNumber, RequiredBloodType)
);
CREATE TABLE HOSPITAL
(
    hospitalID INT (10) NOT NULL,
    website VARCHAR(20) UNIQUE,
    email VARCHAR(255) UNIQUE,
    contactlumber INT (10) UNIQUE,
    street VARCHAR(10),
    city VARCHAR(10),
    hospitalName VARCHAR(15),
    CONSTRAINT HOSPITAL_PK PRIMARY KEY (hospitalID)
);

CREATE TABLE SUPMITS
(
    hospitalID INT (1) NOT NULL,
    RequestNumber INT (10) NOT NULL,
    stockID INT (20) NOT NULL,
    CONSTRAINT SUPMITS_FK1 FOREIGN KEY (hospitalID) REFERENCES HOSPITAL (hospitalID) ON DELETE CASCADE,
    CONSTRAINT SUPMITS_FK2 FOREIGN KEY (RequestNumber) REFERENCES REQUEST (RequestNumber) ON DELETE CASCADE,
    CONSTRAINT SUPRITS_FK3 FOREIGN KEY (stockID) REFERENCES BLOOD_STOCK(StockID) ON DELETE CASCADE,
    CONSTRAINT SUPMITS_PK PRIMARY KEY (hospitalID, Requestllumber, stockID)
);
CREATE TABLE DROWS_FROM
(
    employeeID INT (10) NOT NULL,
    donSSN INT(30) NOT NULL,
    CONSTRAINT DROWS_FROM_FK1 FOREIGN KEY (employeeID) REFERENCES EMPLOYEE (EmployeeID) ON DELETE CASCADE,
    CONSTRAINT DROWS_FROM_FK2 FOREIGN KEY (donSSN) REFERENCES DONOR (donSSN) ON DELETE CASCADE,
    CONSTRAINT DROWS_FROM_PK PRIMARY KEY (employeeID, donSSN)
);
CREATE TABLE BLOOD
(
    bloodID INT (10) NOT NULL,
    bloodType VARCHAR(3) CHECK (bloodType IN (A000)),
    labResult VARCHAR (15),
    dnt_donorSSN INT (20),
    dnt_donation_date DATE,
    Store_bloodStockID INT (10),
    CONSTRAINT BLOOD_FR1 FOREIGN KEY (dnt_donorSSN) REFERENCES DONOR (donSSN) ON DELETE SET NULL,
    CONSTRAINT BLOOD_FK2 FOREIGN KEY (Store_bloodStockID) REFERENCES BLOOD_STOCK (StockID) ON DELETE SET NULL,
    CONSTRAINT BLOOD_PK PRIMARY KEY (bloodID)
);

INSERT INTO blood_bank.donor
VALUES
    (1000000001, "Ahmed Ali", "fit", "Makkah, Al Zaher, 1999-21-19, 2021-01-12, 4)
INSERT INTO blood bank.donor
VALUES (1000000002, Hash Tasser", "unfit", "Makkah", "Al Zaydi,'', 1997-03-17, 2021-09-03, 0);
INSERT INTO blood bank.donor
VALUES (1000000003, Mohammed Khalid", "fit", "Makkah", "Al Zaher','", "2000-08-18", 2021-04-24, 2);
INSERT INTO blood_bank.donor
VALUES
    (1000000884, 'Amjad valid', "Fit', akkah", "Alaaj', '1999-12-20", "2021-02-20', 1);
INSERT INTO blood_bank.donor
VALUES (10000000005, Hira Mohanned", "fit", "Makkah", "Al Seteen", "F", 2002-01-22, 2021-01-22, 3)
SELECT *
FROM blood_bank.donors;

INSERT INTO blood_bank.employee
VALUES
    (143, "Lamar Saleh', 'Sauti", "Doctor", 2000000001, 'F');

INSERT INTO blood_bank.employee
VALUES
    (254, "Sales All", "Saudi", "Nurse", 2000000002, 'M');

INSERT INTO blood_bank.employee
VALUES
    (335, "Saad Kamel", "Saudi", "Nurse", 2000000003, 'M');

INSERT INTO blood_bank.employee
VALUES
    (244, 'Moha Ashraf', "Saudi", "Manager", 2000000004, 'F');

INSERT INTO blood_bank.employee
VALUES
    (533, "Hanan Ahand", "Saudi", "Manager", 2000000005, 'F');

INSERT INTO blood_bank.employee
VALUES
    (192, "Hatan Khaled", "Saudi", "Manager", 2000000000, 'F');

INSERT INTO blood_bank.employee
VALUES
    (215, "Hadeel Pujalled", "Saudi", "Manager", 2000000007, 'M');

SELECT *
FROM blood_bank.employee;

INSERT INTO blood_bank.request
VALUES
    (5433, "2021-04-22", "acceptable", 'all required bloods were valid');
INSERT INTO blood
bank.request
VALUES
    (1234, "2021-05-11", "Partially acceptable", "O- wasn`t exist");
INSERT INTO blood_bank.request
VALUES
    (4564, '2021-18-03', 'unacceptable', 'S+ wasn`t enough');
INSERT INTO blood_bank.request
VALUES
    (7776, "2021-01-12", "canceled", "The hospital find the blood in other bank")
INSERT INTO blood_bank.request
    (requestllumber, dateOfRequest, requestStatus)
VALUES
    (6555, "2021-12-20", "underway");
SELECT *
FROM blood_bank.request;

INSERT INTO blood
bank.hospital
VALUES
    (1009, 'www.Faqesh.com Paquet@gmail.com', 0351234567, 'Al Hamra', 'Jeddah', "Fageeh");

INSERT INTO blood_bank.hospital
VALUES
    (2000, "wer Al_Moor.com", "Al Noor@gmail.com", 0350076533, "Al Naseen", "Makkah", "Alor");

INSERT INTO blood_bank.hospital
VALUES
    (3000, "Ajyad.com", "Ajyad@gmail.com", 0300438532, "Ajyad", "Makkah", "Ajyad");

INSERT INTO blood_bank.hospital
VALUES
    (4000, "ww.hunaAl Madi.com", "MunaAl Madi@gsall.com", 0398499999, "King Fahad", 'Makkah', 'Pune Alwadi');

INSERT INTO blood_bank.hospital
VALUES
    (5000, "er. Abdullah.com", "KingAbduAllah@gmail.com", 0355538932, "Muzdalifah", "Makkah", "King Abdu Allah");

SELECT *
FROM blood_bank.hospital;

INSERT INTO blood_bank.blood_stock
VALUES
    (111, 'A+', 10, 533);

INSERT INTO blood_bank.blood_stock
VALUES
    (112, 'AB-', 5, 244);

INSERT INTO blood_bank.blood_stock
VALUES
    (113, 'O-', 8, 216);

INSERT INTO blood_bank.blood_stock
VALUES
    (114, '0+', 4, 192);

SELECT *
FROM blood_bank.blood_stock;

INSERT INTO blood_bank.drows_from
VALUES
    (143, 1000000003);

INSERT INTO blood_bank.drows_from
VALUES
    (254, 1000000005);

INSERT INTO blood_bank.drows_from
VALUES
    (254, 1000000004);

INSERT INTO blood_bank.drows_from
VALUES
    (335, 1000000002);

INSERT INTO blood_bank.drows_from
VALUES
    (254, 1000000001);

SELECT *
FROM blood_bank.drows_from;


INSERT INTO blood_bank.donor_phones
VALUES
    (1000000001, 0592271025);

INSERT INTO blood_bank.donor_phones
VALUES
    (1000000001, 0553311349);

INSERT INTO blood_bank.donor_phones
VALUES
    (1000000004, 0512345556);

INSERT INTO blood_bank.donor_phones
VALUES
    (1000000004, 0512346789);

INSERT INTO blood_bank.donor_phones
VALUES
    (1000000002, 0550581234);

INSERT INTO blood_bank.donor_phones
VALUES
    (1000000003, 0507188770);

INSERT INTO blood_bank.donor_phones
VALUES
    (1000000005, 0554047519);

SELECT *
FROM blood_bank.donor_phones;


INSERT INTO blood_bank.blood
VALUES
    (1231, 'A+', 'normal', 1000000001, '2021-11-12', 111);

INSERT INTO blood_bank.blood
VALUES
    (1232, '0', 'normal', 1000000005, '2021-10-22', 114);

INSERT INTO blood_bank.blood
VALUES
    (1233, 'AB-', "abnormal", 1000000003, '2021-12-04', 112);

INSERT INTO blood_bank.blood
VALUES
    (1234, "0-", 'normal', 1000000004, '2021-09-20', 113);

INSERT INTO blood_bank.blood
VALUES
    (1235, 'A', 'normal', 1000000001, '2021-04-06', 111);

SELECT*
FROM blood_bank.blood;


INSERT INTO blood_bank.request_blood_types
VALUES
    (1234, 40, 2);

INSERT INTO blood_bank.request_blood_types
VALUES
    (1234, AB, 4);

INSERT INTO blood_bank.request_blood_types
VALUES
    (1234, 0, 5);

INSERT INTO blood_bank.request_blood_types
VALUES
    (4564, A, 4);

INSERT INTO blood_bank.request_blood_types
VALUES
    (4564, 0, 0);

INSERT INTO blood_bank.request_blood_types
VALUES
    (7776, AB, 5);

INSERT INTO blood_bank.request_blood_types
VALUES
    (5433, 'A+', 12);

INSERT INTO blood_bank.request_blood_types
VALUES
    (6565, 8, 5);

INSERT INTO blood_bank.request_blood_types
VALUES
    (6565, 'AB+', 9);

SELECT *
FROM blood_bank.request_blood_types;


INSERT INTO blood_bank.supmits
VALUES
    (1000, 1234, 111 );

INSERT INTO blood_bank.supmits
VALUES
    (2000, 4564, 112);

INSERT INTO blood_bank.supmits
VALUES
    (3000, 5433, 113);

INSERT INTO blood_bank.supmits
VALUES
    (4000, 6565, 114);

INSERT INTO blood_bank.supmits
VALUES
    (5000, 7776, 111);

SELECT *
FROM blood_bank.supmits;


--update a donor's (ssn = 1000000003) phone number

UPDATE donor_phones

SET phoneNO = 551617420

where donSSN= 1000000003 and phoneNO = 507188770;

SELECT *
FROM donor_phones;


--delete all blood older than 3 months or has an abnormal lab results.

DELETE FROM blood

WHERE labResult = 'abnormal'

    OR DATEDIFF (CURRENT_DATE
(), dnt_donation_date) >= 30*33;


--1 SHOW THE NUMBER OF EMPLOYEES IN EACH POSITION

SELECT
    EmployeePosition, COUNT (EmployeeID) AS count
FROM
    blood_bank.employee
GROUP BY EmployeePosition;


SELECT

    h.hospitalID,

    h.hospitalName,

    r.RequestNumber,

    r.DateOfRequest

FROM

    hospital h,

    request r,

    supmits s

WHERE

s. RequestNumber= r.RequestNumber

    AND s.hospitalID = h.hospitalID

    AND r.RequestStatus = 'underway'

ORDER BY 4 DESC;


--SHOW THE MOST REQUESTED BLOOD TYPE WITH IT'S QUANTITY

--3-list each requested bloodType with its total quantity, to get the max later

CREATE VIEW total
AS

    SELECT

        RequiredBloodType, SUM(RequiredBloodQuantity) AS sum

    FROM

        request_blood_types
    GROUP BY RequiredBloodType

    ORDER BY 2 DESC;

--4- get the most request blood type

SELECT RequiredBloodType as bloodType, MAX(sum) as quantity
FROM total;

--5-SHOW HOW MANY TIMES EACH GENDER DONATED IF IT'S GREATER THAN FOUR.

SELECT gender, SUM (NoPrevDonations) as sum

FROM donor

GROUP BY gender

HAVING sum > 43

--6- show latest Donation Date of the donor 'Amjad Walid'
--to check if she can donate again

SELECT nameD, latestDonationDate

FROM Donor

WHERE nameD= 'Amjad Walid';


--7- display the number of donors for each blood type
--to know which blood type has greatest number of donors
SELECT bloodType, COUNT (bloodID) AS DonorsNumber
FROM blood
GROUP BY bloodType
ORDER BY 2 DESC;


--8- display each stack with his manager's name and ssn

--by joining two tables

SELECT StockID, employeeSSN, employeeName
FROM blood_Stock, Employee
WHERE managerID = EmployeeID
ORDER BY stockID;

--9-list all phone numbers for all donors whose blood results
--came out as abnormal to tell them
SELECT d.donSSN, named, phoneNO
FROM donor d, donor_phones ph
WHERE ph.donSSN=d.donSSN AND d.donSSN IN (SELECT dnt_donorSSN
    FROM blood
    WHERE labResult ='abnormal');


--10-list all the quantities of blood that can be given to B+
SELECT bloodType, quantity

FROM blood Stock

WHERE bloodType NOT IN ('A+', 'A', 'AB+, AB-');


--11- select the blood bags of type 0- that are valid for donation,
--order by date of donation
SELECT
    bloodID, bloodType, dnt_donation_date, Store_bloodStockID
FROM
    blood
WHERE
bloodType = '0' AND labResult = 'normal'
ORDER BY 3 ASC;


----*************************THE END**********************************----