
--EXEC InsertPersonGymAndOwner 'Umer','Farooq','523442344','1990-01-01',20,'Kahota','Owner5','Owner3','planet','Markaz, Islamabad';

CREATE PROCEDURE InsertPersonGymAndOwner
    @FName NVARCHAR(255),
    @LName NVARCHAR(255),
    @Phone NVARCHAR(255),
    @DoB DATETIME,
    @Age FLOAT,
    @Address NVARCHAR(255),
    @Username NVARCHAR(255),
    @Password NVARCHAR(255),
    @GymName NVARCHAR(255),
    @GymLoc NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LastPersonID NVARCHAR(10);
    DECLARE @LastGymID NVARCHAR(10);
    DECLARE @NewPersonID NVARCHAR(10);
    DECLARE @NewGymID NVARCHAR(10);
    DECLARE @NewOwnerID NVARCHAR(10);

    -- Get the last Person_ID
    SELECT TOP 1 @LastPersonID = Person_ID
    FROM Person
    ORDER BY Person_ID DESC;

    -- Increment the last ID to get the next available ID
    SET @NewPersonID = CONCAT('P', RIGHT('000' + CAST(RIGHT(@LastPersonID, 3) + 1 AS NVARCHAR(3)), 3));

    -- Insert into Person table
    INSERT INTO Person (Person_ID, Phone, F_name, L_Name, Addresss, DoB, Age, Username, Passwordd, Rolee,Statuss)
    VALUES (@NewPersonID, @Phone, @FName, @LName, @Address, @DoB, @Age, @Username, @Password, 'Owner','Pending');

    -- Get the last Gym_ID
    SELECT TOP 1 @LastGymID = Gym_ID
    FROM Gym
    ORDER BY Gym_ID DESC;

    -- Increment the last ID to get the next available ID
    SET @NewGymID = CONCAT('G', RIGHT('000' + CAST(RIGHT(@LastGymID, 3) + 1 AS NVARCHAR(3)), 3));

    -- Insert into Gym table
    INSERT INTO Gym(Gym_ID, Gym_Name, Locationn)
    VALUES (@NewGymID, @GymName, @GymLoc);

    -- Insert into Owner table
    SET @NewOwnerID = CONCAT('O', RIGHT('000' + CAST(RIGHT(@NewPersonID, 3) AS NVARCHAR(3)), 3));
    INSERT INTO Owner(Owner_ID, Person_ID, Gym_ID)
    VALUES (@NewOwnerID, @NewPersonID, @NewGymID);
END






--EXEC InsertPersonAndTrainer 'Mahad','Rehman','523442344','1990-01-01',20,'Kahota','Mahad','Mahad','Park Road, Islamabad',3;

CREATE PROCEDURE InsertPersonAndTrainer
    @FName NVARCHAR(255),
    @LName NVARCHAR(255),
    @Phone NVARCHAR(255),
    @DoB DATETIME,
    @Age FLOAT,
    @Address NVARCHAR(255),
    @Username NVARCHAR(255),
    @Password NVARCHAR(255),
    @GymLoc NVARCHAR(255),
    @Experience FLOAT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LastPersonID NVARCHAR(10);
    DECLARE @NewPersonID NVARCHAR(10);
    DECLARE @NewTrainerID NVARCHAR(10);

    -- Get the last Person_ID
    SELECT TOP 1 @LastPersonID = Person_ID
    FROM Person
    ORDER BY Person_ID DESC;

    -- Increment the last ID to get the next available ID
    SET @NewPersonID = CONCAT('P', RIGHT('000' + CAST(RIGHT(@LastPersonID, 3) + 1 AS NVARCHAR(3)), 3));

    -- Insert into Person table
    INSERT INTO Person(Person_ID, Phone, F_name, L_Name, Addresss, DoB, Age, Username, Passwordd, Rolee,Statuss)
    VALUES (@NewPersonID, @Phone, @FName, @LName, @Address, @DoB, @Age, @Username, @Password, 'Trainer','Pending');

    -- Get the last Trainer_ID
    SELECT TOP 1 @NewTrainerID = Trainer_ID
    FROM Trainer
    ORDER BY Trainer_ID DESC;

    -- Increment the last ID to get the next available ID
    SET @NewTrainerID = CONCAT('T', RIGHT('000' + CAST(RIGHT(@NewTrainerID, 3) + 1 AS NVARCHAR(3)), 3));

	DECLARE @GymID NVARCHAR(10);
	SELECT @GymID = Gym_ID 
	FROM Gym
	WHERE Locationn = @GymLoc;

	INSERT INTO TrainerXGym (Trainer_ID,Gym_ID)
	VALUES (@NewTrainerID,@GymID);


    -- Insert into Trainer table
    INSERT INTO Trainer (Trainer_ID, Person_ID, Rating, Experience)
    VALUES (@NewTrainerID, @NewPersonID, 0, @Experience);
END

select * from Trainer


EXEC InsertPersonAndMember 'Hashim','Awan','523442344','1990-01-01',20,'Kahota','Usman','Usman','Park Road, Islamabad','Muscle Gain','182 cm','60','Tier A','Dairy';

DROP PROCEDURE InsertPersonAndMember


CREATE PROCEDURE InsertPersonAndMember
(	@FName NVARCHAR(255),
    @LName NVARCHAR(255),
    @Phone NVARCHAR(255),
    @DoB DATETIME,
    @Age FLOAT,
    @Address NVARCHAR(255),
    @Username NVARCHAR(255),
    @Password NVARCHAR(255),
    @GymLoc NVARCHAR(255),
    @Goal NVARCHAR(255),
    @Weight NVARCHAR(255),
    @Height NVARCHAR(225),
    @Subscription NVARCHAR(255),
    @Allergens NVARCHAR(255)
	)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LastPersonID NVARCHAR(10);
    DECLARE @LastMemberID NVARCHAR(10);
    DECLARE @NewPersonID NVARCHAR(10);
    DECLARE @NewMemberID NVARCHAR(10);
	DECLARE @GymID NVARCHAR(10);
    
    -- Get the last Person_ID and Member_ID
    SELECT TOP 1 @LastPersonID = Person_ID
    FROM Person
    ORDER BY Person_ID DESC;

    SELECT TOP 1 @LastMemberID = Member_ID
    FROM Member
    ORDER BY Member_ID DESC;

    -- Increment the last IDs to get the next available IDs
   SET @NewPersonID = CONCAT('P', RIGHT('000' + CAST(RIGHT(@LastPersonID, 3) + 1 AS NVARCHAR(3)), 3));
   SET @NewMemberID = CONCAT('M', RIGHT('000' + CAST(RIGHT(@LastMemberID, 3) + 1 AS NVARCHAR(3)), 3));
   	

    -- Insert into Person table
    INSERT INTO Person (Person_ID, Phone, F_name, L_Name, Addresss, DoB, Age, Username, Passwordd, Rolee, Statuss)
    VALUES (@NewPersonID, @Phone, @FName, @LName, @Address, @DoB, @Age, @Username, @Password, 'Member','Pending');

	SELECT @GymID = Gym_ID 
	FROM Gym
	WHERE Locationn = @GymLoc;

    -- Insert into Member table
    INSERT INTO Member(Member_ID, Person_ID, Gym_ID, Goals, Weightt, Start_datee, Height, Subscription, Allergens)
    VALUES (@NewMemberID, @NewPersonID, @GymID, @Goal, @Weight, GETDATE(), @Height, @Subscription, @Allergens);
END

select * from Member
inner join Person ON Person.Person_ID= Member.Person_ID

exec ShowPendingTrainerMember;
create Procedure ShowPendingTrainerMember
As
Begin
select * from Person where Statuss='Pending' AND (Rolee='Trainer' OR Rolee='Member')
End