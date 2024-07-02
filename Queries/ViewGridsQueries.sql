
---------------------------------------------------------------------------------------------------------------

--QUERIES FOR FORMS

--slect workout plan of memeber
select w.Workout_ID, w.Workout_Name, w.Days, w.Goal, w.Difficulty, w.Exercise_Name, w.Targeted_muscle
from Workout w
inner join WorkxTrainxMem ON WorkxTrainxMem.Workout_ID= w.Workout_ID
where Member_ID='M001'


select Member_ID
from Member
inner join Person
ON Person.Person_ID=Member.Person_ID
where Person.Username='Member1'

--current diet plan
select d.Diet_ID, d.Meal1, d.Meal2, d.Meal3, d.Diet_Type from Diet d inner join DietxmemberxTrainer ON DietxmemberxTrainer.Diet_ID= d.Diet_ID where Member_ID='M001'

--show trainer of member
select t.Trainer_ID, p.F_name, p.L_Name, t.Rating from Trainer t inner join Person p ON p.Person_ID=t.Person_ID inner join TrainerxMember ON t.Trainer_ID=TrainerxMember.Trainer_ID where TrainerxMember.Member_ID = 'M020'

--show reviews of memeber from trianer
select f.Feedback_ID, f.Messagee, f.Rating from Feedback f inner join FeedbackxOwnerxTrainerxMember fx ON fx.Feedback_ID=f.Feedback_ID where f.Given_By='Trainer' AND Member_ID='M011'




----------------------------------------------------------------------
CREATE PROCEDURE GetMealNamesByDietType @DietType varchar(255)
AS
BEGIN
    SELECT M1.Meal_Name
    FROM Diet D
    JOIN Meal M1 ON D.Meal1 = M1.Meal_ID
    WHERE D.Diet_Type = @DietType
    UNION ALL
    SELECT M2.Meal_Name
    FROM Diet D
    JOIN Meal M2 ON D.Meal2 = M2.Meal_ID
    WHERE D.Diet_Type = @DietType
    UNION ALL
    SELECT M3.Meal_Name
    FROM Diet D
    JOIN Meal M3 ON D.Meal3 = M3.Meal_ID
    WHERE D.Diet_Type = @DietType;
END;

EXEC GetMealNamesByDietType 'Fitness';



CREATE PROCEDURE GetMembersByTrainer @TrainerID Nvarchar(255)
AS
BEGIN
    SELECT M.Member_ID, P.F_name, P.L_Name, P.DoB, P.Age, M.Gym_ID, M.Goals, M.Weightt, M.Start_datee, M.Height, M.Subscription, M.Allergens, M.Statuss
    FROM Member M
    JOIN Person P ON M.Person_ID = P.Person_ID
    JOIN TrainerxMember MT ON M.Member_ID = MT.Member_ID
    WHERE MT.Trainer_ID = @TrainerID;
END;

EXEC GetMembersByTrainer 'T001';



SELECT TOP(10)
    T.Trainer_ID, 
    P.F_name, 
    P.L_Name, 
    AVG(F.Rating) as Average_Rating
FROM 
    Trainer T
JOIN 
    Person P ON T.Person_ID = P.Person_ID
JOIN 
    FeedbackxOwnerxTrainerxMember F2 ON T.Trainer_ID = F2.Trainer_ID
JOIN 
    Feedback F ON F2.Feedback_ID = F.Feedback_ID
GROUP BY 
    T.Trainer_ID, P.F_name, P.L_Name
ORDER BY 
    AVG(F.Rating) DESC;


---------------------------------------------------------------------------------------------------------------

EXEC GetRoleByUsernameAndPassword 'Admin', 'Admin1234';

CREATE PROCEDURE GetRoleByUsernameAndPassword (
    @inputUsername NVARCHAR(50),
    @inputPassword NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Rolee NVARCHAR(50);

    -- Check if the username and password match
    SELECT @Rolee = Rolee
    FROM Person
    WHERE Username = @inputUsername AND Passwordd = @inputPassword;

    IF (@Rolee IS NOT NULL)
    BEGIN
        SELECT @Rolee AS Rolee;
    END
    ELSE
    BEGIN
        PRINT 'No matching record found.';
    END
END;