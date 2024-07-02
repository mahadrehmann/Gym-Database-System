--CREATE DATABASE PROJECT

-- Create Person Table
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

-- Create Admin Table
CREATE TABLE Admin (
    Admin_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

-- Create Gym Table
CREATE TABLE Gym (
    Gym_ID NVARCHAR(255) PRIMARY KEY,
    Gym_Name NVARCHAR(255),
    Locationn NVARCHAR(255)
);

-- Create Owner Table
CREATE TABLE Owner (
    Owner_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    Gym_ID NVARCHAR(255),
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID)
);

-- Create Trainer Table
CREATE TABLE Trainer (
    Trainer_ID NVARCHAR(255) PRIMARY KEY,
    Person_ID NVARCHAR(255),
    Rating FLOAT,
    Experience FLOAT,
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

-- Create Member Table
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
    Status NVARCHAR(255),
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID)
);


-- Create TrainerxMember Table
CREATE TABLE TrainerxMember (
    Trainer_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

-- Create Appointment Table
CREATE TABLE Appointment (
    Appointment_ID NVARCHAR(255) PRIMARY KEY,
    Gym_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    Status NVARCHAR(255),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

-- Create TrainerxGym Table
CREATE TABLE TrainerxGym (
    Trainer_ID NVARCHAR(255),
    Gym_ID NVARCHAR(255),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID),
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID)
);

-- Create Payment Table
CREATE TABLE Payment (
    Gym_ID NVARCHAR(255),
    Member_ID NVARCHAR(255),
    Amount FLOAT,
    FOREIGN KEY (Gym_ID) REFERENCES Gym(Gym_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

-- Create Subscription Table
CREATE TABLE Subscription (
    Subscription_ID NVARCHAR(255) PRIMARY KEY,
    Tier NVARCHAR(255),
    Price FLOAT,
    Duration NVARCHAR(255)
);

-- Create Feedback Table
CREATE TABLE Feedback (
    Feedback_ID NVARCHAR(255) PRIMARY KEY,
    Messagee NVARCHAR(255),
    Rating FLOAT,
    Given_By NVARCHAR(255)
);


-- Create FeedbackxOwnerxTrainerxMember Table
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


-- Create Equipment Table
CREATE TABLE Equipment (
    Equipment_ID FLOAT PRIMARY KEY,
    Equipment_Name NVARCHAR(255)
);
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

-- Create Exercise Table
CREATE TABLE Exercise (
    Exercise_ID FLOAT PRIMARY KEY,
    Exercise_Name NVARCHAR(255)
);

-- Create EquipmentxExercise Table
CREATE TABLE EquipmentxExercise (	
    Exercise_ID FLOAT,
    Equipment_ID FLOAT,
    Setss FLOAT,
    Reps FLOAT,
    Rest_Intervals NVARCHAR(255),
    FOREIGN KEY (Exercise_ID) REFERENCES Exercise(Exercise_ID),
    FOREIGN KEY (Equipment_ID) REFERENCES Equipment(Equipment_ID)
);



-- Create Meal Table
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

-- Create Diet Table
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

-- Create DietxmemberxTrainer Table
CREATE TABLE DietxmemberxTrainer (
    Diet_ID FLOAT,
    Member_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    FOREIGN KEY (Diet_ID) REFERENCES Diet(Diet_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

-- Create WorkxTrainxMem Table
CREATE TABLE WorkxTrainxMem (
    Workout_ID FLOAT,
    Member_ID NVARCHAR(255),
    Trainer_ID NVARCHAR(255),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);










