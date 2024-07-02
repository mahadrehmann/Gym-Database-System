
drop table Person



ALTER TABLE Member
Drop Column Statuss;

ALTER TABLE Person
ADD Statuss NVARCHAR(255);

UPDATE Person
SET Statuss = 'Approved'
---------------------------------------------------------------------------------------------------------------
CREATE TABLE Person (
    Person_ID NVARCHAR(255) PRIMARY KEY,
    Phone NVARCHAR(255),
    F_name NVARCHAR(255),
    L_Name NVARCHAR(255),
    M_Name NVARCHAR(255),
    Addresss NVARCHAR(255),
    DoB DATETIME,
    Age Float,
    Username NVARCHAR(255),
    Passwordd NVARCHAR(255),
    Rolee NVARCHAR(255)
);


Insert Into [dbo].[Person](Person_ID,phone,F_name,L_Name,M_Name, Addresss,DOB, Age,Username, Passwordd,Rolee)
Select Person_ID,phone,F_name,L_Name,M_Name, Addresss,DOB, Age,Username, Passwordd,Rolee from [dbo].[Person]

Select* from Person


Drop Table Person
---------------------------------------------------------------------------------------------------------------

CREATE TABLE Admin (
    Admin_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

Insert Into [dbo].[Admin](Admin_ID, Person_ID)
Select Admin_ID, Person_ID from [dbo].[Admin]

Drop Table Admin
---------------------------------------------------------------------------------------------------------------


-- Create Gym Table	done
CREATE TABLE Gym (
    Gym_ID NVARCHAR(255) PRIMARY KEY,
    Gym_Name NVARCHAR(255),
    Locationn NVARCHAR(255)
);

Insert Into [dbo].[Gym](Gym_ID, Gym_Name, Locationn)
Select Gym_ID, Gym_Name, Locationn from [dbo].[Gym]

select * from Gym

Drop Table Gym
---------------------------------------------------------------------------------------------------------------

-- Create Owner Table	done
CREATE TABLE Owner (
    Owner_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    Gym_ID NVARCHAR(255),
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID)
);

Insert Into [dbo].[Owner](Owner_ID, Person_ID, Gym_ID)
Select Owner_ID, Person_ID, Gym_ID from [dbo].[Owner]

Drop Table Owner
---------------------------------------------------------------------------------------------------------------



-- Create Trainer Table	done
CREATE TABLE Trainer (
    Trainer_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    Rating FLOAT,
    Experience FLOAT,
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

Insert Into [dbo].[Trainer](Trainer_ID, Person_ID, Rating, Experience)
Select Trainer_ID, Person_ID, Rating, Experience from [dbo].[Trainer]

INSERT INTO Trainer (Trainer_ID, Person_ID, Rating, Experience)
VALUES ('None', 'P051', 4.5, 5);

Drop Table Trainer
---------------------------------------------------------------------------------------------------------------

-- Create Member Table	done
CREATE TABLE Member (
    Member_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    Gym_ID NVARCHAR(255),
    Goals NVARCHAR(255),
    Weightt NVARCHAR(255),
    Start_datee DATETIME,
    Height NVARCHAR(225),
    Subscription NVARCHAR(255),
    Allergens NVARCHAR(255),
    Statuss NVARCHAR(255),
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID)
);

Insert Into [dbo].[Member](Member_ID, Person_ID, Gym_ID, Goals, Weightt, Start_datee, Height, Subscription, Allergens, Statuss)
Select Member_ID, Person_ID, Gym_ID, Goals, Weightt, Start_datee, Height, Subscription, Allergens, Statuss from [dbo].[member]

INSERT INTO Member (Member_ID, Person_ID, Gym_ID, Goals, Weightt, Start_datee, Height, Subscription, Allergens, Statuss)
VALUES ('None', 'P052', 'G001', 'Lose weight', '70 kg', '2024-05-10', '170 cm', 'S001', 'None', 'Approved');

Drop Table Member
---------------------------------------------------------------------------------------------------------------

-- Create TrainerxMember Table	done
CREATE TABLE TrainerxMember (
    Trainer_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

Insert Into [dbo].[TrainerxMember](Trainer_ID, Member_ID)
Select Trainer_ID, Member_ID from [dbo].[MemberXTrainer]


Drop Table MemberXTrainer
---------------------------------------------------------------------------------------------------------------

-- Create TrainerxGym Table	done
CREATE TABLE TrainerxGym (
    Trainer_ID NVARCHAR(255),
    Gym_ID NVARCHAR(255),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID)
);

Insert Into [dbo].[TrainerxGym](Trainer_ID, Gym_ID)
Select Trainer_ID, Gym_ID from [dbo].[TrainerxGym]

drop table TrainerxGym
---------------------------------------------------------------------------------------------------------------

-- Create Payment Table	done
CREATE TABLE Payment (
    Gym_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    Amount FLOAT,
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);


Insert Into [dbo].[Payment]( Gym_ID, Member_ID, Amount)
Select Gym_ID, Member_ID, Amount from [dbo].[Payment]

select * from Payment

drop table Payment
---------------------------------------------------------------------------------------------------------------

-- Create Subscription Table	DONE
CREATE TABLE Subscription (
    Subscription_ID NVARCHAR(255) PRIMARY KEY,
    Tier NVARCHAR(255),
    Price FLOAT,
    Duration NVARCHAR(255)
);
Insert Into [dbo].[Subscription]( Subscription_ID, Tier, Price, Duration)
Select Subscription_ID, Tier, Price, Duration from [dbo].[Subscription]
drop table Subscription
---------------------------------------------------------------------------------------------------------------

--Create Feedback Table	DONE
CREATE TABLE Feedback (
    Feedback_ID NVARCHAR(255) PRIMARY KEY,
    Messagee NVARCHAR(255),
    Rating FLOAT,
    Given_By NVARCHAR(255)
);

Insert Into [dbo].[Feedback]( Feedback_ID, Messagee, Rating, Given_By)
Select  Feedback_ID, Messagee, Rating, Given_By from [dbo].[Feedback]

drop table Feedback
---------------------------------------------------------------------------------------------------------------


-- Create FeedbackxOwnerxTrainerxMember Table	DONE
CREATE TABLE FeedbackxOwnerxTrainerxMember (
    Feedback_ID NVARCHAR(255),
    Owner_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    FOREIGN KEY (Feedback_ID) REFERENCES Feedback(Feedback_ID),
    FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);
Insert Into [dbo].[FeedbackxOwnerxTrainerxMember](Feedback_ID, Owner_ID, Trainer_ID, Member_ID)
Select Feedback_ID, Owner_ID, Trainer_ID, Member_ID from [dbo].[Feedback2x]

drop table Feedback2x

---------------------------------------------------------------------------------------------------------------

-- Create Appointment Table	done
CREATE TABLE Appointment (
    Appointment_ID NVARCHAR(255) PRIMARY KEY,
    Gym_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    Statuss NVARCHAR(255),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

-- Row 1
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A001', 'G001', 'M001', 'T001', 'Approved');

-- Row 2
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A002', 'G001', 'M002', 'T002', 'Pending');

-- Row 3
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A003', 'G001', 'M003', 'T003', 'Approved');

-- Row 4
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A004', 'G002', 'M004', 'T004', 'Pending');

-- Row 5
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A005', 'G003', 'M005', 'T005', 'Approved');

-- Row 6
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A006', 'G003', 'M006', 'T006', 'Pending');

INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A007', 'G004', 'M007', 'T007', 'Approved');

INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A008', 'G001', 'M008', 'T008', 'Pending');
INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A009', 'G005', 'M009', 'T009', 'Approved');

INSERT INTO Appointment (Appointment_ID, Gym_ID, Member_ID, Trainer_ID, Statuss)
VALUES ('A010', 'G005', 'M010', 'T010', 'Pending');


---------------------------------------------------------------------------------------------------------------


-- Create Meal Table	DONE
CREATE TABLE Meal (
    Meal_ID FLOAT PRIMARY KEY,
    Meal_Name NVARCHAR(255),
    Calories FLOAT,
    Fibre NVARCHAR(255),
    Nutrients NVARCHAR(255),
    Allergens NVARCHAR(255),
    Carbohydrates NVARCHAR(255),
    Timee NVARCHAR(255)
);


-- Insert data into Meal table
INSERT INTO Meal (Meal_ID, Meal_Name, Calories, Fibre, Nutrients, Allergens, Carbohydrates, Timee)
SELECT Meal_ID, Meal_Name, Calories, Fibre, Nutrients, Allergens, Carbohydrates, Timee
FROM [Meal];

Drop table Meal
select * from Meal
---------------------------------------------------------------------------------------------------------------

-- Create Diet Table	DONE
CREATE TABLE Diet (
    Diet_ID FLOAT PRIMARY KEY,
    Meal1 FLOAT,
    Meal2 FLOAT,
    Meal3 FLOAT,
    Diet_Type NVARCHAR(255),
    FOREIGN KEY (Meal1) REFERENCES Meal(Meal_ID),
    FOREIGN KEY (Meal2) REFERENCES Meal(Meal_ID),
    FOREIGN KEY (Meal3) REFERENCES Meal(Meal_ID)
);

-- Insert data into Diet table
INSERT INTO Diet (Diet_ID, Meal1, Meal2, Meal3, Diet_Type)
SELECT Diet_ID, Meal1, Meal2, Meal3, Diet_Type
FROM [Diet];

drop table Diet
select * from Diet

---------------------------------------------------------------------------------------------------------------

-- Create DietxmemberxTrainer Table	DONE
CREATE TABLE DietxmemberxTrainer (
    Diet_ID FLOAT,
    Member_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    FOREIGN KEY (Diet_ID) REFERENCES Diet(Diet_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

-- Insert data into DietxmemberxTrainer table
INSERT INTO DietxmemberxTrainer (Diet_ID, Member_ID, Trainer_ID)
SELECT Diet_ID, Member_ID, Trainer_ID FROM [DietxmemberxTrainer];

drop table DietxmemberxTrainer


---------------------------------------------------------------------------------------------------------------
-- Create Workout Table	DONE
CREATE TABLE Workout (
    Workout_ID FLOAT PRIMARY KEY,
    Workout_Name NVARCHAR(255),
    Days NVARCHAR(255),
    Goal NVARCHAR(255),
    Difficulty NVARCHAR(255),
    Exercise_Name NVARCHAR(255),
    Targeted_muscle NVARCHAR(255)
);
Insert Into [dbo].[Workout](Workout_ID, Workout_Name,Days, Goal, Difficulty, Exercise_Name, Targeted_muscle)
Select Workout_ID, Workout_Name,Days, Goal, Difficulty, Exercise_Name, Targeted_muscle from [dbo].[Workout]

drop table Workout
---------------------------------------------------------------------------------------------------------------

-- Create WorkxTrainxMem Table`DONE
CREATE TABLE WorkxTrainxMem (
    Workout_ID FLOAT,
    Member_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

-- Insert data into WorkxTrainxMem table
INSERT INTO WorkxTrainxMem (Workout_ID, Member_ID, Trainer_ID)
SELECT Workout_ID, Member_ID, Trainer_ID FROM [WorkxTainxMem];

drop table WorkxTainxMem

---------------------------------------------------------------------------------------------------------------


-- Create Equipment Table	DONE
CREATE TABLE Equipment (
    Equipment_ID FLOAT PRIMARY KEY,
    Equipment_Name NVARCHAR(255)
);
-- Insert data into Equipment table
INSERT INTO Equipment (Equipment_ID, Equipment_Name)
SELECT Equipment_ID, Equipment_Name
FROM [Equipment];


drop table Equipment
select * from Equipment
---------------------------------------------------------------------------------------------------------------

-- Create Exercise Table	DONE
CREATE TABLE Exercise (	
    Exercise_ID FLOAT PRIMARY KEY,
    Equipment_ID FLOAT,
    Setss FLOAT,
    Reps FLOAT,
    Rest_Intervals NVARCHAR(255),
    FOREIGN KEY (Equipment_ID) REFERENCES Equipment(Equipment_ID)
);

-- Insert data into Exercise table
INSERT INTO Exercise (Exercise_ID, Equipment_ID, Setss, Reps, Rest_Intervals)
SELECT Exercise_ID, Equipment_ID, Setss, Reps, Rest_Intervals
FROM [Exercise];


drop table Exercise

select * from Exercise
---------------------------------------------------------------------------------------------------------------

-- Create ExerciosexWorkout Table	DONE
CREATE TABLE ExercisexWorkout (
    Exercise_ID FLOAT,
    Workout_ID FLOAT,
    FOREIGN KEY (Exercise_ID) REFERENCES Exercise(Exercise_ID),
    FOREIGN KEY (Workout_ID) REFERENCES Workout(Workout_ID)
);

INSERT INTO ExercisexWorkout (Exercise_ID, Workout_ID)
SELECT Exercise_ID, Workout_ID FROM [ExercisexWorkout];

drop table ExercisexWorkout

