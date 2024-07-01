CREATE DATABASE CarPoolService;

CREATE TABLE People (
	Home_Address varChar(255) UNIQUE NOT NULL,
	First_Name varChar(255) NOT NULL,
	Last_Name varChar(255) NOT NULL,
	Phone_Numb varChar(12) UNIQUE NOT NULL,
	Email varChar(255) UNIQUE NOT NULL,
	Has_Car varChar(3) NOT NULL,
	PRIMARY KEY (Home_Address)
);

CREATE TABLE Bookings (
	Booking_ID int(3) UNIQUE NOT NULL,
	Person_Address varChar(255) UNIQUE NOT NULL,
	Booking_Time timestamp(20) NOT NULL,
	Booking_Status varChar(25) NOT NULL,
	PRIMARY KEY (Booking_ID),
	FOREIGN KEY (Person_Address) REFERENCES People(Home_Address)
);

CREATE TABLE CarOwner (
	License_Number varChar(14) UNIQUE NOT NULL,
	First_Name varChar(255) NOT NULL,
	Last_Name varChar(255) NOT NULL,
	Phone_Numb varChar(12) UNIQUE NOT NULL,
	PRIMARY KEY (License_Number)
);

CREATE TABLE Car (
	Reg_Num varChar(8) UNIQUE NOT NULL,
	License_Number varChar(14) UNIQUE NOT NULL,
	Make varChar(255) NOT NULL,
	Model varChar(255) NOT NULL,
	Year_Of_Manufacture varChar(4) NOT NULL,
	Color varChar(255) NOT NULL,
	Numb_Seats int(2) NOT NULL,
	PRIMARY KEY (Reg_Num),
	FOREIGN KEY (License_Number) REFERENCES CarOwner(License_Number)
);

CREATE TABLE Schedule (
	Booking_ID int(2) UNIQUE NOT NULL,
	Departure_Time time(8) NOT NULL,
	Departure_Location varChar(255) UNIQUE NOT NULL,
	Destination varChar(255) NOT NULL,
	Car_Reg_Numb varChar(8) UNIQUE NOT NULL,
	Numb_Seats int(2) NOT NULL,
	PRIMARY KEY (Departure_Location),
	FOREIGN KEY (Car_Reg_Numb) REFERENCES Car(Reg_Num),
	FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);