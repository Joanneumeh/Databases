--d22126855

--Insert data – table Restraunt
-- Restraunt inserted first
INSERT INTO Restraunt (restID, restNum, restaddress) 
VALUES (1339, 'Smithfield', '68 Smithfield avenue');
INSERT INTO Restraunt (restID, restNum, restaddress) 
VALUES (1307, 'Gallowtree', '8 gallowtree gate');
INSERT INTO Restraunt (restID, restNum, restaddress) 
VALUES (1378, 'Henrys', '104 Henry st');
INSERT INTO Restraunt (restID, restNum, restaddress) 
VALUES (1329, 'Omni', '6 omni shopping centre');
INSERT INTO Restraunt (restID, restNum, restaddress) 
VALUES (1387, 'Blanch', '42 westend retail park');

INSERT INTO Manager (ManagerID, restID)
VALUES (865, 1339);
INSERT INTO Manager (ManagerID, restID)
VALUES (866, 1307);
INSERT INTO Manager (ManagerID, restID)
VALUES (867, 1378);
INSERT INTO Manager (ManagerID, restID)
VALUES (868, 1329);
INSERT INTO Manager (ManagerID, restID)
VALUES (869, 1387);

INSERT INTO TBZ(tableID, tablelocation)
VALUES (9, 'window');
INSERT INTO TBZ(tableID, tablelocation)
VALUES (8, 'window');
INSERT INTO TBZ(tableID, tablelocation)
VALUES (7, 'interior');
INSERT INTO TBZ(tableID, tablelocation)
VALUES (11, 'window');
INSERT INTO TBZ(tableID, tablelocation)
VALUES (21, 'interior');


--Insert data – table Customer
--Customer inserted next
INSERT INTO Customer (custID, custName, custEmail, custaddress, custAge, BookingID) 
VALUES (1, 'D. Smith','dsmith@yahoo.co.uk', '12 Bother street', 21, 973);
INSERT INTO Customer (custID, custName, custEmail, custaddress, custAge, BookingID) 
VALUES (2, 'B. Byrne','bb@gmail.com', '13 Bother street', 21, 974);
INSERT INTO Customer(custID, custName, custEmail, custaddress, custAge, BookingID) 
VALUES (3, 'X. Dobbs','xdobbs@gmail.com', '14 Bother elms', 35, 975);
INSERT INTO Customer (custID, custName, custEmail, custaddress, custAge, BookingID) 
VALUES (4, 'A. Grant',+'drant@gmail.com', '15 Bother street', 21, 976);
INSERT INTO Customer(custID, custName, custEmail, custaddress, custAge, BookingID) 
VALUES (5, 'S. Fitz',+'sofia@hotail.com', '16 Bother avenue', 35, 977);


--Insert data – table Staff
--Staff inserted next
INSERT INTO Staff (staffID, staffJob, staffName, staffPhNo, staffEmail, staffaddress, staffDob) 
VALUES (10, 'Waiting Staff', 'D. Smith', 0876543211, 'dsmith@burgershack.com', '12 Bother street', 12/02/2002);
INSERT INTO Staff (staffID, staffJob, staffName, staffPhNo, staffEmail, staffaddress, staffDob) 
VALUES (11, 'Waiting Staff', 'H. Sally', 0876543254, 'popgirl@burgershack.com', '54 palm elms', 12/02/1987);
INSERT INTO Staff (staffID, staffJob, staffName, staffPhNo, staffEmail, staffaddress, staffDob) 
VALUES (12, 'Manager', 'S. Fay', 0876547292, 'sFay@burgershack.com', '18 Bother street', 26/10/1993);
INSERT INTO Staff (staffID, staffJob, staffName, staffPhNo, staffEmail, staffaddress, staffDob) 
VALUES (13, 'Waiting Staff', 'L. Higgins', 0876643250, 'higgie@burgershack.com', '1 palm elms', 13/09/1999);
INSERT INTO Staff (staffID, staffJob, staffName, staffPhNo, staffEmail, staffaddress, staffDob) 
VALUES (14,  'Manager', 'L. Griffen', 0876547484, 'workmans@burgershack.com', '96 Bother green', 04/11/2000);


--Insert data – table BookingRecipts
--BookingRecipts inserted next
INSERT INTO BookingRecipts (bookingID, custID, timeID, tableID, tableAmountID, staffID) 
VALUES (9876, 1, '04-SEP-22', 1, 6, 10);
INSERT INTO BookingRecipts (bookingID, custID, timeID, tableID, tableAmountID, staffID) 
VALUES (9836, 2, '05-SEP-22', 2, 2, 11);
INSERT INTO BookingRecipts (bookingID, custID, timeID, tableID, tableAmountID, staffID)  
VALUES (9807, 3, '11-AUG-22', 3, 6, 12);
INSERT INTO BookingRecipts (bookingID, custID, timeID, tableID, tableAmountID, staffID) 
VALUES (9822, 4, '10-OCT-22', 4, 8, 13);
INSERT INTO BookingRecipts (bookingID, custID, timeID, tableID, tableAmountID, staffID) 
VALUES (9810, 5, '10-OCT-22', 5, 4, 14);


-- CustGuest inserted finally
INSERT INTO CustGuest (custGuestID, bookingID, GuestName, GuestEmail) 
VALUES (123, 9876,'Sophie angel', 'angelgirl@gmail.com');
INSERT INTO CustGuest (custGuestID, bookingID, GuestName, GuestEmail) 
VALUES (98, 9836, 'Rob Kardashian', 'robby@gmail.com');
INSERT INTO CustGuest (custGuestID, bookingID, GuestName, GuestEmail) 
VALUES (12, 9807, 'Taylour reid', 'trl@hotmail.com');
INSERT INTO CustGuest (custGuestID, bookingID, GuestName, GuestEmail) 
VALUES (74, 9822, 'Harry petes', 'harroldp@gmail.com');
INSERT INTO CustGuest (custGuestID, bookingID, GuestName, GuestEmail) 
VALUES (23, 9810, 'britanny hughes', 'brihug@gmail.com');
COMMIT;

/*UPDATE custGuest SET bookingID = 9876 WHERE tableID =1;
UPDATE custGuest SET bookingID = 9836 WHERE tableID =2;
UPDATE custGuest SET bookingID = 9807 WHERE tableID =3;
UPDATE custGuest SET bookingID = 9822 WHERE tableID =4;
UPDATE custGuest SET bookingID = 9810 WHERE tableID =5;
*/

-- UNION STAFF AND BOOKINGRECIPTS USING STAFFID
SELECT staffID FROM staff
UNION
SELECT staffID FROM bookingRecipts
ORDER BY staffID;

-- CREATE VIEW MANAGER CAN SEE INFO ON CUSTOMERS AND STAFF
CREATE VIEW Man AS
SELECT *
FROM CUSTOMER, STAFF;

-- LEFT OUTER JOIN USING STAFFID FOR TABLE STAFF AND BOOKINGRECIPTS 
SELECT staffname, staffEmail
FROM STAFF
LEFT JOIN BOOKINGRECIPTS
USING (staffID)
ORDER BY staffName ASC;

-- LEFT OUTER JOIN USING CUSTID FOR TABLE CUSTOMER AND BOOKINGRECIPTS 
SELECT custName, custEmail
FROM CUSTOMER
RIGHT JOIN BOOKINGRECIPTS
USING (custID)
ORDER BY custName ASC;

--INNER JOIN USING BOOKINGID FROM TABLES BOOKINGRECIPTS AND CUSTGUEST
SELECT timeID, tableID 
FROM BOOKINGRECIPTS
JOIN CUSTGUEST
USING (bookingID)
WHERE tableID between 1 and 10
GROUP BY timeID, tableID;

--INTERSECT QUERY 
SELECT timeID, tableID
FROM BOOKINGRECIPTS
WHERE tableID between 1 and 10

INTERSECT

SELECT custName, custID
FROM CUSTGUEST
WHERE custID > 10;