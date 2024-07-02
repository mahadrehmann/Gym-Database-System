
select * from DietXMemberXTrainer 
select * from Diet 

Exec CreateDietPlanMember '2','3','4','M001','Weight Loss';
drop procedure CreateDietPlanMember

CREATE PROCEDURE CreateDietPlanMember
    @MealID1 NVARCHAR(255),
    @MealID2 NVARCHAR(255),
    @MealID3 NVARCHAR(255),
    @UserID NVARCHAR(255),
    @Diet_Type NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;


    -- Check if all meal IDs exist in the system (you may need additional validation logic here)
    IF NOT EXISTS (SELECT 1 FROM Meal  WHERE Meal_ID IN (@MealID1, @MealID2, @MealID3))
    BEGIN
        PRINT 'One or more meal IDs do not exist.';
        RETURN;
    END

    DECLARE @NewDietID NVARCHAR(255);
	SELECT TOP 1 @NewDietID = Diet_ID
    FROM Diet 
    ORDER BY Diet_ID DESC;


    -- Insert meal IDs into the DietXMeal  table
    INSERT INTO Diet (Diet_ID,Meal1,Meal2,Meal3,Diet_Type)
    VALUES (@NewDietID+1, @MealID1,@MealID2,@MealID3,@Diet_Type)

    -- Insert corresponding records into the MealXMemberXTrainer  table
    INSERT INTO DietXMemberXTrainer  (Diet_ID, Member_ID, Trainer_ID)
    VALUES (@NewDietID+1, @UserID, 'None');

END

Exec CreateDietPlanTrainer '1','2','3','T001','hello';
CREATE PROCEDURE CreateDietPlanTrainer
    @MealID1 NVARCHAR(255),
    @MealID2 NVARCHAR(255),
    @MealID3 NVARCHAR(255),
    @UserID NVARCHAR(255),
    @Diet_Type NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;


    -- Check if all meal IDs exist in the system (you may need additional validation logic here)
    IF NOT EXISTS (SELECT 1 FROM Meal  WHERE Meal_ID IN (@MealID1, @MealID2, @MealID3))
    BEGIN
        PRINT 'One or more meal IDs do not exist.';
        RETURN;
    END

    DECLARE @NewDietID NVARCHAR(255);
	SELECT TOP 1 @NewDietID = Diet_ID
    FROM Diet 
    ORDER BY Diet_ID DESC;


    -- Insert meal IDs into the DietXMeal  table
    INSERT INTO Diet (Diet_ID,Meal1,Meal2,Meal3,Diet_Type)
    VALUES (@NewDietID+1, @MealID1,@MealID2,@MealID3,@Diet_Type)

    -- Insert corresponding records into the MealXMemberXTrainer  table
    INSERT INTO DietXMemberXTrainer  (Diet_ID, Member_ID, Trainer_ID)
    VALUES (@NewDietID+1, 'None',@UserID);

END