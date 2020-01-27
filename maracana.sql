-- Creating the Database

CREATE DATABASE maracana;


-- Table Counter

CREATE TABLE counter
(counter_no varchar(10),
ticket_no varchar(10) NOT NULL,
ticket_type varchar(25) NOT NULL,
ticket_price float NOT NULL,
program_id varchar(10) NOT NULL,
booking_id varchar(25) NOT NULL,
CONSTRAINT counterpk PRIMARY KEY (ticket_no),
CONSTRAINT counterfk1 FOREIGN KEY (program_id) REFERENCES program(program_id) ON
UPDATE CASCADE,
CONSTRAINT counterfk2 FOREIGN KEY (booking_id) REFERENCES customer (booking_id) ON
UPDATE CASCADE)
Engine=InnoDB;


-- Table Program_Ticket

CREATE TABLE program_ticket
(pticket_no VARCHAR(10) NOT NULL,
ticket_counter_no VARCHAR(10) NOT NULL,
CONSTRAINT program_ticketpk PRIMARY KEY (pticket_no),
CONSTRAINT program_ticketfk FOREIGN KEY (pticket_no) REFERENCES counter (ticket_no) ON
UPDATE CASCADE)
Engine=InnoDB;


-- Table Concession

CREATE TABLE concession
(cticket_no VARCHAR(10) NOT NULL,
con_counter_no INT(10) NOT NULL,
CONSTRAINT concessionpk PRIMARY KEY (cticket_no),
CONSTRAINT concessionfk FOREIGN KEY (cticket_no) REFERENCES counter (ticket_no) ON
UPDATE CASCADE)
Engine=InnoDB;


-- Table Food
CREATE TABLE food
(fticket_no VARCHAR(10) NOT NULL,
food_type VARCHAR(25) NOT NULL,
food_vendor VARCHAR(25) NOT NULL,
CONSTRAINT foodpk PRIMARY KEY (fticket_no),
CONSTRAINT foodfk FOREIGN KEY (fticket_no) REFERENCES concession (cticket_no) ON
UPDATE CASCADE)
Engine=InnoDB;


-- Table Stand
CREATE TABLE stand
(ticket_no VARCHAR(10) NOT NULL,
stand_no VARCHAR(10) NOT NULL,
stand_name VARCHAR(25) NOT NULL,
CONSTRAINT standpk PRIMARY KEY (ticket_no),
CONSTRAINT standfk FOREIGN KEY (ticket_no) REFERENCES counter (ticket_no) ON UPDATE
CASCADE)
Engine=InnoDB;


-- Table Parking
CREATE TABLE parking
(ticket_no VARCHAR(10) NOT NULL,
stall_no VARCHAR(10) NOT NULL,
level_no INT(10) NOT NULL,
Gate_no INT(10) NOT NULL,
CONSTRAINT parkingpk PRIMARY KEY (ticket_no),
CONSTRAINT parkingfk1 FOREIGN KEY (ticket_no) REFERENCES stand (ticket_no) ON UPDATE
CASCADE,
CONSTRAINT parkingfk2 FOREIGN KEY (gate_no) REFERENCES gate (gate_no) ON UPDATE
CASCADE)
Engine=InnoDB;


-- Table Gate
CREATE TABLE gate
(location VARCHAR(25) NOT NULL,
gate_no INT(10) NOT NULL,
CONSTRAINT gatepk PRIMARY KEY (gate_no))
Engine=InnoDB;


-- Table Employee
CREATE TABLE EMPLOYEE
( Employee_id varchar (10) not null,
Employee_name varchar(25) not null,
Department varchar(25) not null,
Employee_Age int(3) not null,
Employee_Phone flloat not null,
Employee_Email varchar(25) not null,
Employee_Street varchar(25) not null,
Employee_City varchar(25) not null,
Employee_State varchar(25) not null,
Employee_zipcode varchar(5) not null,
CONSTRAINT employee_pk PRIMARY KEY (Employee_id) )
Engine=INNODB;


-- Table Program_Chart
CREATE TABLE PROGRAM_CHART
( Employee_id varchar (25) not null,
Program_id varchar(25) not null,
CONSTRAINT Program_Chart_pk PRIMARY KEY (Employee_id, Program_id),
CONSTRAINT program_chartfk1 FOREIGN KEY (Employee_id) REFERENCES
employee(Employee_id) ON UPDATE CASCADE,
CONSTRAINT program_chartfk2 FOREIGN KEY (program_id) REFERENCES program (program_id)
ON UPDATE CASCADE)
Engine=InnoDB;


-- Table Program
CREATE TABLE Program
( Program_id varchar (25) not null,
Program_name varchar(10) not null,
Program_date date not null,
sponsor_id varchar(25) not null,
CONSTRAINT Program_pk PRIMARY KEY (Program_id),
CONSTRAINT Program_fk FOREIGN KEY (sponsor_id) REFERENCES SPONSOR (sponsor_id) ON
update cascade)
Engine=InnoDB;


-- Table Sponsor
CREATE TABLE Sponsor
( Sponsor_id varchar (25) not null,
Sponsor_name varchar(10) not null,
Donation_Amount varchar(20) not null,
CONSTRAINT Spnsor_pk PRIMARY KEY (Sponsor_id) )
Engine=InnoDB;


-- Table Game
CREATE TABLE GAME
( gProgram_id varchar (25) not null,
Gameday varchar(10) not null,
Tournament_name varchar(10),
CONSTRAINT Game_pk PRIMARY KEY (gProgram_id),
CONSTRAINT Game_fk FOREIGN KEY (gProgram_id ) REFERENCES Program (Program_id) ON
UPDATE CASCADE)
Engine=InnoDB;


-- Table Concert
CREATE TABLE CONCERT
( cProgram_id varchar (10) not null,
Concert_Type varchar(30) not null,
CONSTRAINT Concert_pk PRIMARY KEY (cProgram_id),
CONSTRAINT Concert_fk FOREIGN KEY (cProgram_id ) REFERENCES Program (Program_id) ON
UPDATE CASCADE)
Engine=InnoDB;


-- Table Exhibition
CREATE TABLE EXHIBITION
( eProgram_id varchar (25) not null,
Themes varchar(10) not null,
CONSTRAINT Exhibition_pk PRIMARY KEY (eProgram_id),
CONSTRAINT Exhibition_fk FOREIGN KEY (eProgram_id ) REFERENCES Program (Program_id)
ON UPDATE CASCADE)
Engine=InnoDB;


-- Table Customer
Create Table customer
( Booking_id varchar(25) NOT NULL,
Name varchar(25) NOT NULL,
Phone int(10),
Street varchar(30),
City varchar(25),
ZIP int(10),
State varchar(2),
Country varchar(25),
Email varchar(25),
Age int(3),
C_type_member varchar(25) NOT NULL,
C_type_specialguest varchar(25) NOT NULL,
CONSTRAINT customer_pk PRIMARY KEY (Booking_id))
Engine=InnoDB;


-- Table Member
Create table member
( Membership_id varchar(10) NOT NULL,
mBooking_id varchar(25) NOT NULL,
Membership_level varchar(10) NOT NULL,
CONSTRAINT member_pk PRIMARY KEY (membership_id),
CONSTRAINT member_fk FOREIGN KEY (mBooking_id) REFERENCES customer (Booking_id) ON
update cascade)
Engine=InnoDB;


-- Table Special_Guest
Create table Special_Guest
( sBooking_id varchar(25) NOT NULL,
Guest_type varchar(25) NOT NULL,
CONSTRAINT Special_Guest_pk PRIMARY KEY (sBooking_id),
CONSTRAINT Special_Guest_fk FOREIGN KEY (sBooking_id) REFERENCES customer
(Booking_id) ON update cascade)
Engine=InnoDB;


-- Table Beverages
Create table beverages
( BTicket_no varchar(10) NOT NULL,
Beverage_type varchar(30) NOT NULL,
Brand varchar(30) NOT NULL,
CONSTRAINT Beverages_pk PRIMARY KEY (BTicket_no),
CONSTRAINT Beverages_fk FOREIGN KEY (BTicket_no) REFERENCES concession (CTicket_no)
ON update cascade)
Engine=InnoDB;


-- Table VIP
Create table vip
( vTicket_no varchar(10) NOT NULL,
Seat_Number int(10) NOT NULL,
Vrow_number int(10) NOT NULL,
CONSTRAINT vip_pk PRIMARY KEY (vTicket_no),
CONSTRAINT vip_fk FOREIGN KEY (vTicket_no) REFERENCES stand (Ticket_no) ON update
cascade)
Engine=InnoDB;


-- Table Regular
Create table Regular
( rTicket_no varchar(10) NOT NULL,
RSeat_Number int(10) NOT NULL,
Rrow_number int(10) NOT NULL,
Zone varchar(10),
CONSTRAINT Regular_pk PRIMARY KEY (rTicket_no),
CONSTRAINT Regular_fk FOREIGN KEY (rTicket_no) REFERENCES stand (Ticket_no) ON update
cascade)
Engine=InnoDB;


-- Table Box
Create table box
( BTicket_no varchar(10) NOT NULL,
Box_Number int(10) NOT NULL,
CONSTRAINT box_pk PRIMARY KEY (BTicket_no),
CONSTRAINT box_fk FOREIGN KEY (BTicket_no) REFERENCES stand (Ticket_no) ON update
cascade)
Engine=InnoDB;



-- CODING FOR DATA --------------------------------------------------------------------------------------------


-- CUSTOMER

INSERT INTO `customer` (`Booking_id`,`name`, `phone`,`street`, `city`, `ZIP`,`State`,`Country`,
`Email`, `Age`,`C_type_member`,`C_type_specialguest`) VALUES
('M6', 'Abhijay Sharma',78945612,'Duke St.','Sao
Paulo',84984521,'SP','Brazil','abhihrv@gmail.com',25,'N','N'),
('S7', 'Bill Gates',78945612,'Washington St.','New York',54688,'NY','United
States','bgates@gmail.com',56,'N','Y'),
('M8', 'Ricardo Paul', 79845612,'Rojo St.','Rio',48912879,'RJ','Brazil','rpaul@gmail.com',37,'Y','N'),
('S9', 'Ronaldinho Gaucho',78945612,'David St.','Santa
Maria',78974565,'RS','Brazil','rgaucho@gmail.com',41,'N','Y'),
('R10', 'Daniel Ferreira',78945612,'Nevada St.','Idaho',64795,'ID','United
States','dferreira@gmail.com',28,'N','N'),
('M11', 'Jose Silva', 34774483, 'Alameidas street', 'Belo Horizonte', 30458046, 'BH', 'Brazil',
'jose12@gmail.com', 42, 'Y', 'N'),
('S12', 'Rodrigo Santeiro',27773362, 'dois anjos street', 'Sao Paulo', 44483323, 'SP', 'Brazil',
'rodri_23f@gmail.com', 45, 'N', 'Y'),
('M13', 'Daniel Santos', 47659337, 'esperanto street', 'Fortaleza', 7489456, 'CE', 'Brazil',
'daniels10@gmail.com', 18, 'Y', 'N'),
('M14', 'Joao dos Santos', 44755789, 'parque dos irmaos street', 44638839, 'RJ', 'Brazil',
'joaosantinho@hotmail.com', 24, 'Y', 'N'),
('S15', 'Tiago Silva', 33746557, 'travessa tabajara street', 48884849, 'SP', 'Brazil',
'tiagos10@hotmail.com', 30, 'N', 'Y'),
('M1', 'Connie Leung', 6726190, 'Naymar St', 'Santa Maria', 830179, 'SS', 'Brazil',
'connieleung793@gmail.com', 25, 'Y', 'N'),
('M2', 'Chong Oh',80151887,'Pele St', 'Kuala Lumpur',3978123,'SR', 'Malaysia','chong.oh@utah.edu',
45, 'Y', 'N'),
('S2', 'Christina White', 47987968, 'Philipee St', 'Sao Paulo', 234899, 'SP', 'Brazil',
'christina.white@gmail.com', 15, 'N', 'Y'),
('S4', 'Jaco Johnson', 67531680, 'Lake St', 'Los Angeles', 802349, 'CA', 'USA',
'jacob.johnson@gmail.com', 24, 'Y','N'),
('S3', 'Leon Bridge', 89864421, 'Duke St', 'Fort Worth', 998234, 'TX', 'USA', 'leon.bridge@gmail.com',
24,'Y','N'),
('M16', 'Magpie Mushroom',78945678,'Road St.','San
Jose',560025,'ME','Australia','mag.mush@gmail.com',22,'Y','N'),
('S17', 'Narendra Modi',98444561,'Janpath St.','New
Delhi',324506,'DL','India','narendra.modi@gmail.com' ,52,'N','Y'),
('R18', 'Nicole Fish',89339331,'Richmond St.','Detroit',48208,'MI','United
States','mag.mush@gmail.com',22,'N','Y'),
('R19', 'Lindsai Green',80125432,'Raymond St.','Sunnyvale',94043,'MI','United
States','lindsai.g@gmail.com',29,'N','Y'),
('R20', 'Michelle King',80126999,'Berling St.','Midvale',84047,'UT','United
States','michelle.king@gmail.com',35,'N','Y');


-- MEMBER

INSERT INTO `member`
(`mbooking_id`,`Membership_id`,`Membership_level`)
VALUES
('M8','1','Gold'),
('M16','2', 'Silver'),
( 'M1','3', 'Silver'),
( 'M2','4', 'Gold'),
('M6','5','Gold'),
('M11','11','Gold'),
( 'M13','13', 'Silver'),
( 'M14','14', 'Gold');


-- SPECIAL_GUEST

INSERT INTO `special_guest`(`sBooking_id`,`Guest_type`) VALUES
('S7','CEO'),
('S9','Veteran'),
('S17', 'Head of State'),
('S2', 'CEO'),
('S4', 'Veteran'),
('S3', 'Artist'),
('S12', 'Musician'),
('S15', 'Soccer Player');


-- EMPLOYEE

INSERT INTO
`employee`(`employee_id`,`employee_name`,`department`,`Employee_age`,`Employee_phone`,`Empl
oyee_email`,`Employee_street`,`Employee_city`,`Employee_State`,`Employee_zipcode`) VALUES
('E1','Roberto Silva','Maintainance',45,78945612,' rsilva1@gmail.com ','Gauz
St.','Maracana','RJ','78945'),
('E2','Ricardo Navas','Cleaning',35,789456213,'Rnavas@gmail.com','Grande
St.','Maracana','RJ','78945'),
('E3', 'Roberto Silva','Catering',29,98564213,'Robsilva@gmail.com','Maria St.','Maracana','RJ','45678'),
('E4','Jesus Santero','HR',40,75349153,'Jesuss@gmail.com','Guerreo St.','Maracana','RJ','85462'),
('E5','Santos Valega','Security',34,65478422,'Santosv@gmail.com','Tango St.','Maracana','RJ','74569'),
('E6', 'Raimundo Alves', 'custodial', 20, 4458734, 'raimundo10@gmail.com', 'alameida street', 'Rio',
'RJ', '60339'),
('E7', 'Jose augusto', 'concession', 36, 7765489, 'augustinho55@gmail.com', 'travessa albigue street',
'Rio', 'RJ', '60773'),
('E8', 'Fernanda bandeira', 'accounting', 29, 6695784, 'fernandab10@gmail.com', 'bandeirantes street',
'Rio', 'RJ', '67008'),
('E9', 'Joana Silveira', 'ticket_counter', 17, 5576875, 'joana123@gmail.com', 'tufanos street', 'Rio', 'RJ',
'76553'),
('E10', 'Daniel jesson', 'custodial', 21, 3377488, 'danieljes@gmail.com', 'satiro dias street', 'Rio', 'RJ',
'55678'),
('E11', 'Santiago Gracia', 'Accounting', 26, 1028562, 's.gracia@gmail.com', 'Madison Ave', 'Rio', 'RJ',
'82372'),
('E12', 'Sofia Rodríguez', 'HR', 30, 7182763, 's.rodriguez@hotmail.com', 'Gauz St.','Maracana','RJ',
'17382'),
('E13', 'Valentia López', 'Security', 45, 3178610, 'v.lopez@gmail.com', 'Tango St.','Maracana','RJ',
'74569'),
('E14', 'Camila González', 'Concession', 18, 346178, 'c.gonzalez.gmail.com','Madison Ave', 'Rio', 'RJ',
'82372'),
('E15', 'Isablla Fernández', 'HR', 45, 738927, 'i.fernandez@hotmail.com', 'Gauz St.', 'Maracana','RJ',
'17382'),
('E16', 'Gaurav Nadig','Security',25,9000013456,'nadiggaurav@gmail.com','Wellington
St.','Rio','RJ','78845'),
('E17','Brad Pitt','Catering',35,789456224,'ismyexinthesamecompany@gmail.com','Rodeodrive
St.','Rio','RJ','78840'),
('E18', 'Christoph Waltz','Accounting',29,9856345561,'whoisthisguy@gmail.com','Maple
St.','Rio','RJ','78841'),
('E19','Angelina Jolie','Catering',40,7534915323,'joilesnotacting@gmail.com','Almond
St.','Rio','RJ','78840'),
('E20','Oprah Winfrey','HR',34,6547842212,'o@gmail.com','Presidents St.','Rio','RJ','78839');


-- SPONSOR

INSERT INTO `sponsor`(`Sponsor_id`,`Sponsor_name`,`donation_amount`) VALUES
('SP1','Guerreiro Navas','$500000'),
('SP2','Ronaldo Herreira','$1000000'),
('SP3','Roberto Silva','$400000'),
('SP4','Adriano Jose','$500000'),
('SP5','Raquel Freitas','$5000000'),
('SP6', 'Adidas', '$3500000'),
('SP7', 'Nike', '$30000000'),
('SP8', 'Coke', '$20000000'),
('SP9', 'Petrobras', '$50000000'),
('SP10', 'Skol', '$200000'),
('SP11', 'Martra Silva', '$6000000'),
('SP12', 'Monica Alves', '$8000000'),
('SP13', 'Paula Fernandes','$10000000'),
('SP14', 'Alessandra Ambrosio','$20000000'),
('SP15', 'Marisa Monte','$50000000'),
('SP16','P&G','$1000000'),
('SP17','Emirates','$30000000'),
('SP18','Standard Chartered','$400000'),
('SP19','ESPN','$1000000'),
('SP20','Reliance Industries','$1000000');


-- PROGRAM

INSERT INTO `program`(`Program_id`,`Program_name`,`Program_date`,`Sponsor_id`) VALUES
('CP1','Metallica World Tour','20180515','
SP1'),
('CP2','Coldplay Brazil Concert','20180318','
SP2'),
('GP3','France vs Argentina','20170625','
SP3'),
('GP4','Italy vs Germany','20160805','
SP4'),
('GP5','England vs Belgium','20150428','
SP5');
('GP11','USA vs Equador','20180225','
SP11'),
('GP12', 'Vasco vs Sao Paulo', '20180320',
'SP12'),
('GP13','Vasco vs Palmeiras','2018105','
SP13'),
('GP14', 'Corinthians vs Santos', '20180411',
'SP14'),
('GP15', 'Spain vs Portugal', '20180616',
'SP15'),
('CP16','Imagine Dragons Evolve Tour','20180630','
SP16'),
('EP17','International Wine Festival','20180728','
SP17'),
('GP18','USA vs Vietnam','20181120','
SP18'),
('GP19','India vs Pakistan','20181220','
SP19'),
('GP20','Mexico vs Brazil','20181228','
SP20');('CP6', 'Beyonce World Tour', '20190728',
'SP14'),
('CP7','Ed Sheeran Tour', '20191217',
'SP13'),
('EP2', 'Auto Expo 2016', '20190501','
SP15'),
('EP3', 'Auto Expo 2018', '20191220','
SP11'),
('GP1','Brazil vs Malasia', '20190807','
SP12');


-- GAME

INSERT INTO `game`(`gProgram_id`,`Gameday`,`Tournament_name`) VALUES
('GP3','2','Amistoso'),
('GP4','14','Amistoso'),
('GP5','5','Amistoso'),
('GP11','11','Amistoso'),
('GP12','12','Campeonato Brasileiro'),
('GP13','13','Copa America'),
('GP14','14','Campeonato brasileiro'),
('GP15','15','Amistoso'),
('GP18','25','Amistoso'),
('GP19','30','Amistoso'),
('GP20','32','Copa America'),
('G1', '07','Amistoso');


-- CONCERT

INSERT INTO `concert`(`cProgram_id`,`Concert_Type`) VALUES
('CP16','Alternative'),
('CP1','Metal'),
('CP2','Electronic'),
('CP6','R&B'),
('CP7', 'Hip Hop');


-- EXHIBITION
INSERT INTO `Exhibition`(`eProgram_id`,`Themes`) VALUES
('EP2', 'Atuomobile'),
('EP3', 'Atuomobile'),
('EP17', 'Culinary');


-- COUNTER

INSERT INTO `counter` (`Counter_no`,`Ticket_no`, `Ticket_Type`,`Ticket_price`,`Program_id`,
`Booking_id`) VALUES
('CT3','PB1','Physical Booking',30,'CP1','M6'),
('CT4','CB2','Physical Booking',5,'CP1','M6'),
(NULL,'PV2','Online Booking',NULL,'CP2','S7'),
(NULL,'PB2','Online Booking',30,'GP3','M8'),
('CT3','CF1','Physical Booking',3,'GP3','M8'),
(NULL,'PV3','Online Booking',NULL,'GP4','S9'),
('CT5','PR1','Physical Booking',80,'GP5','R10'),
(NULL, 'PB11', 'Online booking', 30, 'GP11', 'M11'),
(NULL, 'PV12', 'Online booking', NULL, 'GP12', 'S132'),
(NULL, 'PB13', 'Online booking', 30, 'GP13', 'M13'),
(NULL, 'PB14', 'Online booking', 30, 'GP14', 'M14'),
(NULL, 'PV15', 'Online booking', NULL, 'GP15', 'S15'),
(NULL, 'CB13', 'Online booking', 5, 'GP13', 'M13'),
(NULL, 'CB14', 'Online booking', 5, 'GP14', 'M14'),
(NULL, 'CF13', 'Online booking', 10, 'GP13', 'M13'),
(NULL, 'CF14', 'Online booking', 10, 'GP14', 'M14'),
(Null, 'CF134', 'Online Booking', 30, 'CP6', 'M1'),
('CT2', 'CB232', 'Physical Booking',30, 'GP1', 'M2'),
(Null, 'PV50', 'Online Booking', Null, 'CP7','S2'),
(Null,'PV123', 'Online Booking', Null, 'EP3','S4'),
(Null, 'PV8734', 'Online Booking', Null, 'EP3','S3'),
(NULL,'PB16','Online Booking', 30.00, 'CP16','M16'),
(NULL,'CF16','Online Booking', 10.00, 'CP16','M16'),
(NULL,'PV17','Online Booking',NULL,'GP19','S17'),
(NULL,'CB17','Online Booking', NULL,'GP19','S17'),
(NULL,'CF17','Online Booking',NULL,'GP19','S17'),
('CT5','PR18','Physical Booking',80.00,'EP17','R18'),
('CT6','PR19','Physical Booking',80.00,'GP18','R19'),
('CT6','CB19','Physical Booking',15.00,'GP18','R19'),
('CT7','PR20','Physical Booking',80.00,'GP20','R20'),
('CT7','CB20','Physical Booking',15.00,'GP20','R20'),
('CT7','CF20','Physical Booking',30.00,'GP20','R20'),
(Null, 'PB134', 'Online Booking', 30, 'CP6', 'M1'),
('CT2', 'PB232', 'Physical Booking',30, 'GP1', 'M2');


-- PROGRAM TICKET

INSERT INTO `program_ticket` (`Pticket_no`, `ticket_counter_no`) VALUES
('PB1', 'CT3'),
('PV2', Null),
('PB2', Null),
('PV3', Null),
('PR1', 'CT5'),
('PB11', Null),
('PV12', Null),
('PB13', NULL),
('PB14', NULL),
('PV15', NULL),
('PV50', Null),
('PV123', Null),
('PV8734', Null),
('PB16', NULL),
('PV17', NULL),
('PR18','CT5'),
('PR19','CT6'),
('PR20','CT7'),
('PB134', Null),
('PB232','CT2');


-- CONCESSION

INSERT INTO `concession` (`cTicket_no`, `Con_Counter_no`) VALUES
('CF1','CCT3'),
('CF14','CCT4'),
('CF13','CCT3'),
('CF134','CCT4'),
('CF16','CCT3'),
('CF17','CCT1'),
('CF20','CCT7'),
('CB2','CCT4'),
('CB13','CCT4'),
('CB14','CCT4'),
('CB232','CCT3'),
('CB17','CCT1'),
('CB19','CCT6'),
('CB20','CCT7');


-- FOOD

INSERT INTO `food` (`FTicket_no`,`Food_type`,`Food_vendor`) VALUES
('CF1','Cheese Burger', 'FV1'),
('CF14','Hot Dog', 'FV1'),
('CF13','Nachos', 'FV2'),
('CF16','Popcorn', 'FV2'),
('CF17','Doughnut', 'FV2'),
('CF20','Tuna Sandwich', 'FV3'),
('CF134','Chicken Biryani', 'FV4');


-- BEVERAGES
INSERT INTO `beverages` (`BTicket_no`,`Beverage_type`,`Brand`) VALUES
('CB2','Soda', 'CocaCola'),
('CB13','Soda', 'Brasil Kirin'),
('CB14','Beer', 'Bohemia'),
('CB17','Soda', 'CocaCola'),
('CB19','Beer', 'Three Monkey'),
('CB20','Beer', 'Three Monkey');


-- STAND

INSERT INTO `Stand` (`Ticket_no`, `Stand_no`, `Stand_name`) VALUES
('CF134', 'ST3', 'Pele'),
('CB232', 'ST3', 'Pele'),
('PV50', 'ST1', 'Garrincha'),
('PV8734', 'ST1', 'Garrincha'),
('PV123', 'ST2', 'Zico'),
('PB1', 'ST4', 'Bebeto'),
('CB2', 'ST4', 'Bebeto'),
('PV2', 'ST1', 'Garrincha'),
('PB2', 'ST4', 'Bebeto'),
('CF1', 'ST4', 'Bebeto'),
('PV3', 'ST2', 'Zico'),
('PR1', 'ST5', 'Denilson'),
('PB11', 'ST3', 'Pele'),
('PV12', 'ST2', 'Zico'),
('PB13', 'ST3', 'Pele'),
('CB13', 'ST3', 'Pele'),
('CF13', 'ST3', 'Pele'),
('PB14', 'ST4', 'Bebeto'),
('CB14', 'ST4', 'Bebeto'),
('CF14', 'ST4', 'Bebeto'),
('PV15', 'ST1', 'Garrincha'),
('PB16', 'ST3', 'Pele'),
('CF16', 'ST3', 'Pele'),
('PV17', 'ST1', 'Garrincha'),
('CB17', 'ST1', 'Garrincha'),
('CF17', 'ST1', 'Garrincha'),
('PR18', 'ST6', 'Ronaldo'),
('PR19', 'ST6', 'Ronaldo'),
('CB19', 'ST6', 'Ronaldo'),
('PR20', 'ST5', 'Denilson'),
('CB20', 'ST5', 'Denilson'),
('CF20', 'ST5', 'Denilson'),
('PB134', 'ST3', 'Pele'),
('PB232', 'ST3', 'Pele');


-- VIP

INSERT INTO `vip` (`vTicket_no`, `Seat_number`, `vrow_number`) VALUES
('PV50', 101, 'L49'),
('PV8734', 35, 'L40'),
('PV123', 13, 'C22'),
('PV2', 2337, 'Z72'),
('PV3', 134, 'L62'),
('PV12', 2337, 'Z72'),
('PV15', 1037, 'X22'),
('PV17', 27, 'B38'),
('CB17', 27, 'B38'),
('CF17', 27, 'B38');


-- REGULAR

INSERT INTO `regular` (`rTicket_no`, `rSeat_number`, `rrow_number`, `Zone`) VALUES
('PR1', 7659, 'H49', 'A1'),
('PR18', 969, 'C49', 'A4'),
('PR19', 6609, 'I11', 'A2'),
('CB19', 6609, 'I11', 'A2'),
('PR20', 21, 'A01', 'A7'),
('CB20', 21, 'A01', 'A7'),
('CF20', 21, 'A01', 'A7');


-- PARKING

INSERT INTO `parking`(`ticket_no`,`stall_no`,`level_no`,`Gate_no`) VALUES
('PB1','P4',1,2),
('PV2','P1',1,1),
('PB2','P4',1,2),
('PV3','P2',2,1),
('PR1','P5',3,3),
('PB11','P3',2,2),
('PV12','P1',1,1),
('PB13','P3',2,2),
('PB14','P4',1,2),
('PV15','P1',1,1),
('PV50','P1',1,1),
('PV123','P2',1,1),
('PV8734','P1',1,1),
('PB16','P3',2,2),
('PV17','P1',1,1),
('PR18','P6',3,3),
('PR19','P6',3,3),
('PR20','P5',2,3),
('PB134','P3',1,2),
('PB232','P3',2,2);


-- GATE

INSERT INTO `gate`(`location`,`Gate_no`) VALUES
('North Entrance',1),
('South Entrance',2),
('East Entrance',3),
('West Entrance',4);


-- BOX

INSERT INTO `box`(`bticket_no`,`box_number`) VALUES
('PB1',1),
('PB2',2),
('PB11',3),
('PB13',4),
('PB14',5),
('PB16',6),
('PB134',3),
('PB232',5);


-- PROGRAM CHART

INSERT INTO `program_chart`(`employee_id`, `program_id`) VALUES
('E1','CP1'),
('E2','CP2'),
('E3','GP3'),
('E4','GP4'),
('E5','GP5'),
('E6', 'GP11'),
('E7', 'GP12'),
('E8', 'GP13'),
('E9', 'GP14'),
('E10', 'GP15'),
('E11', 'CP16'),
('E12', 'EP17'),
('E13', 'GP18'),
('E14', 'GP19'),
('E15', 'GP20'),
('E16','CP6'),
('E17','CP7'),
('E18','EP2'),
('E19','EP3'),
('E20','GP1');


-- Queries -----------------------------------------------------------------------------------------------------

-- 1. Find all customers who have seen games and their ticket prices.

Select name , ticket_price FROM
customer LEFT JOIN counter ON
customer.booking_id=counter.booking_id
WHERE counter.program_id LIKE "GP%" AND Ticket_no NOT LIKE "C%";


-- 2. How many members have ordered food while watching a concert? 

SELECT COUNT( customer.Booking_id)
FROM
Customer
join Member
on customer.Booking_id = member.mBooking_id
join counter
on customer.booking_id = counter.booking_id
join Concession
on counter.Ticket_no = concession.cticket_no
join Food
on food.fTicket_no = concession.cTicket_no;


-- 3. How many customers have to go through the East entrance?

SELECT * FROM customer WHERE Booking_id
IN
(SELECT Booking_id FROM counter WHERE Ticket_no
IN
(SELECT Ticket_no FROM parking WHERE Gate_no
IN
(SELECT Gate_no FROM gate WHERE Location='East Entrance')));


-- 4. What is the Maximum Donation amount

SELECT MAX(Donation_Amount) FROM sponsor;


-- 5. Total sum of Game tickets sale

SELECT SUM(ticket_price) FROM counter WHERE program_id IN
(SELECT gprogram_id FROM game);


-- Views --------------------------------------------------------------------------------------------------------------


-- 1: Member customers from Brazil

Create view BMembers as
(Select * from customer,member where customer.Booking_ID=member.mbooking_ID
AND country=’Brazil’);


-- View 2: Sponsors for Game events
Create view GSponsors as
SELECT sponsor_name FROM Sponsor WHERE Sponsor_id
IN
(SELECT Sponsor_id FROM Game LEFT JOIN Program ON
Game.gprogram_id=Program.Program_id);


-- Stored Procedure --------------------------------------------------------------------------------------------------


-- Stored Procedure 1: To get the total number of sales depending on the country

delimiter//
CREATE PROCEDURE `storedproc_salescountry`(IN getCountry VARCHAR(25))
begin
SELECT SUM(Ticket_price) FROM counter WHERE Booking_id
IN
(SELECT Booking_id FROM Customer WHERE country=getCountry);
END//


-- 2. Stored Procedure 2: To get employees' names

delimiter//
CREATE PROCEDURE storedproc_Employee(IN getName VARCHAR(25))
begin
SELECT * FROM program WHERE program_id
IN
(SELECT Program_id FROM Program_chart WHERE Employee_id
IN
(SELECT Employee_Id FROM Employee WHERE Employee_Name=getName));
END //





















