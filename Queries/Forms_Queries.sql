Select* from DietPlanUsedBy

alter table Person
drop column M_Name 


----- 1

SELECT 
    p.F_name, 
   p.L_name, 
    p.Addresss, 
    p.DOB, 
    p.Age,
    m.Start_datee
FROM 
    Person p
INNER JOIN 
    Member m ON p.Person_ID = m.Person_ID
INNER JOIN 
    TrainerXMember mt ON m.Member_ID = mt.Member_ID
WHERE 
    mt.Trainer_ID = 'T001'
	And m.Gym_ID = 'G001' 
   
--- Procedure
CREATE PROCEDURE Query1 
    @Trainer_ID nvarchar(255), 
    @Gym_ID nvarchar(255)
AS
BEGIN
    SELECT 
        p.F_name, 
        p.L_name, 
        p.Addresss, 
        p.DOB, 
        p.Age,
        m.Start_datee
    FROM 
        Person p
    INNER JOIN 
        Member m ON p.Person_ID = m.Person_ID
    INNER JOIN 
        TrainerXMember mt ON m.Member_ID = mt.Member_ID
    WHERE 
        mt.Trainer_ID = @Trainer_ID
	    And m.Gym_ID = @Gym_ID
END

EXEC Query1 'T001', 'G001'



---2


SELECT 
    p.F_name, 
    p.L_name, 
    p.M_name, 
    p.Addresss, 
    p.DOB, 
    p.Age,
    m.Start_Datee
FROM 
    Person p
INNER JOIN 
    Member m ON p.Person_ID = m.Person_ID
INNER JOIN 
    DietXmemberxTrainer mxt ON m.Member_ID = mxt.Member_ID
LEFT JOIN 
    Diet d ON mxt.Diet_ID = d.Diet_ID
WHERE 
    m.Gym_ID = 'G001' 
    AND d.Diet_Type = 'weight loss';

---- Procedure

CREATE PROCEDURE Query2 
    @Gym_ID nvarchar(255), 
    @Diet_Type nvarchar(255)
AS
BEGIN
    SELECT 
        p.F_name, 
        p.L_name, 
        p.Addresss, 
        p.DOB, 
        p.Age,
        m.Start_Datee
    FROM 
        Person p
    INNER JOIN 
        Member m ON p.Person_ID = m.Person_ID
    INNER JOIN 
        DietXmemberxTrainer mxt ON m.Member_ID = mxt.Member_ID
    LEFT JOIN 
        Diet d ON mxt.Diet_ID = d.Diet_ID
    WHERE 
        m.Gym_ID = @Gym_ID 
        AND d.Diet_Type = @Diet_Type
END

EXEC Query2 'G001', 'weight loss'

----3
SELECT 
    m.Member_ID,
    p.F_name AS First_Name,
    p.L_Name AS Last_Name,
    p.DoB AS Date_of_Birth,
    m.Gym_ID,
    m.Goals,
    m.Weightt AS Weight,
    m.Start_datee AS Start_Date,
    m.Height,
    m.Allergens,
    m.Statuss,
    d.Diet_Type
FROM 
    Member m
JOIN 
    Person p ON m.Person_ID = p.Person_ID
JOIN 
    DietPlanUsedBY dubm ON m.Member_ID = dubm.Member_ID
JOIN 
    Diet d ON dubm.Diet_ID = d.Diet_ID
WHERE 
    dubm.Trainer_ID = 'T010' -- Specify the Trainer_ID of the specific trainer
    AND dubm.Diet_ID = 16; -- Specify the Diet_ID of the specific diet plan

------- Procedure

CREATE PROCEDURE Query3 
    @Trainer_ID nvarchar(255), 
    @Diet_ID nvarchar(255)
AS
BEGIN
    SELECT 
        m.Member_ID,
        p.F_name AS First_Name,
        p.L_Name AS Last_Name,
        p.DoB AS Date_of_Birth,
        m.Gym_ID,
        m.Goals,
        m.Weightt AS Weight,
        m.Start_datee AS Start_Date,
        m.Height,
        m.Allergens,
        m.Statuss,
        d.Diet_Type
    FROM 
        Member m
    JOIN 
        Person p ON m.Person_ID = p.Person_ID
    JOIN 
        DietPlanUsedBY dubm ON m.Member_ID = dubm.Member_ID
    JOIN 
        Diet d ON dubm.Diet_ID = d.Diet_ID
    WHERE 
        dubm.Trainer_ID = @Trainer_ID
        AND dubm.Diet_ID = @Diet_ID
END


EXEC Query3 'T010', '16'

---5

SELECT
    dt.Diet_ID,
    dt.Diet_Type,
    m1.Meal_Name AS Meal1_Name,
    m2.Meal_Name AS Meal2_Name,
    m3.Meal_Name AS Meal3_Name
FROM
    Diet dt
INNER JOIN
    Meal m1 ON dt.Meal1 = m1.Meal_ID AND m1.Timee = 'Breakfast'
INNER JOIN
    Meal m2 ON dt.Meal2 = m2.Meal_ID AND m2.Timee = 'Breakfast'
INNER JOIN
    Meal m3 ON dt.Meal3 = m3.Meal_ID AND m3.Timee = 'Breakfast'
WHERE
    dt.Diet_ID IN (
        SELECT
            dt.Diet_ID
        FROM
            Diet dt
        INNER JOIN
            Meal m1 ON dt.Meal1 = m1.Meal_ID AND m1.Timee = 'Breakfast'
        INNER JOIN
            Meal m2 ON dt.Meal2 = m2.Meal_ID AND m2.Timee = 'Breakfast'
        INNER JOIN
            Meal m3 ON dt.Meal3 = m3.Meal_ID AND m3.Timee = 'Breakfast'
        GROUP BY
            dt.Diet_ID
        HAVING
            SUM(CAST(REPLACE(m1.Calories, ' ', '') AS INT)) +
            SUM(CAST(REPLACE(m2.Calories, ' ', '') AS INT)) +
            SUM(CAST(REPLACE(m3.Calories, ' ', '') AS INT)) < 500
    );

------- Procedure

CREATE PROCEDURE Query5
AS
BEGIN
    SELECT
        dt.Diet_ID,
        dt.Diet_Type,
        m1.Meal_Name AS Meal1_Name,
        m2.Meal_Name AS Meal2_Name,
        m3.Meal_Name AS Meal3_Name
    FROM
        Diet dt
    INNER JOIN
        Meal m1 ON dt.Meal1 = m1.Meal_ID AND m1.Timee = 'Breakfast'
    INNER JOIN
        Meal m2 ON dt.Meal2 = m2.Meal_ID AND m2.Timee = 'Breakfast'
    INNER JOIN
        Meal m3 ON dt.Meal3 = m3.Meal_ID AND m3.Timee = 'Breakfast'
    WHERE
        dt.Diet_ID IN (
            SELECT
                dt.Diet_ID
            FROM
                Diet dt
            INNER JOIN
                Meal m1 ON dt.Meal1 = m1.Meal_ID AND m1.Timee = 'Breakfast'
            INNER JOIN
                Meal m2 ON dt.Meal2 = m2.Meal_ID AND m2.Timee = 'Breakfast'
            INNER JOIN
                Meal m3 ON dt.Meal3 = m3.Meal_ID AND m3.Timee = 'Breakfast'
            GROUP BY
                dt.Diet_ID
            HAVING
                SUM(CAST(REPLACE(m1.Calories, ' ', '') AS INT)) +
                SUM(CAST(REPLACE(m2.Calories, ' ', '') AS INT)) +
                SUM(CAST(REPLACE(m3.Calories, ' ', '') AS INT)) < 500
        );
END

select * from Meal

EXEC Query5

select * from Member

--6



SELECT Diet_ID, Diet_Type
FROM (
    SELECT
        dt.Diet_ID,
        dt.Diet_Type,
        (
            SELECT
                SUM(CAST(REPLACE(REPLACE(REPLACE(m.Carbohydrates, 'g', ''), ' ', ''), 'grams', '') AS FLOAT))
            FROM
                Meal m
            WHERE
                m.Meal_ID IN (dt.Meal1, dt.Meal2, dt.Meal3)
        ) AS TotalCarbohydrates
    FROM
        Diet dt
) AS DietCarbs
WHERE
    TotalCarbohydrates < 300;

	------ Procedure

	CREATE PROCEDURE Query6
AS
BEGIN
    SELECT Diet_ID, Diet_Type
    FROM (
        SELECT
            dt.Diet_ID,
            dt.Diet_Type,
            (
                SELECT
                    SUM(CAST(REPLACE(REPLACE(REPLACE(m.Carbohydrates, 'g', ''), ' ', ''), 'grams', '') AS FLOAT))
                FROM
                    Meal m
                WHERE
                    m.Meal_ID IN (dt.Meal1, dt.Meal2, dt.Meal3)
            ) AS TotalCarbohydrates
        FROM
            Diet dt
    ) AS DietCarbs
    WHERE
        TotalCarbohydrates < 300;
END

EXEC Query6


--7

CREATE Procedure Query7
AS
BEGIN
SELECT DISTINCT w.Workout_ID, w.Workout_Name
FROM Workout w
LEFT JOIN ExerciseXworkout exw ON w.Workout_ID = exw.Workout_ID
LEFT JOIN Exercise eex ON exw.Exercise_ID = eex.Exercise_ID
LEFT JOIN Equipment eq ON eex.Equipment_ID = eq.Equipment_ID
WHERE eq.Equipment_ID IS NULL;
END

EXEC Query7


--Query 8


CREATE Procedure Query8
AS
BEGIN
SELECT Diet_ID, Meal1, Meal2, Meal3, Diet_Type
FROM Diet
WHERE Diet_ID NOT IN (
    SELECT d.Diet_ID
    FROM Diet d
    JOIN Meal m ON d.Meal1 = m.Meal_ID OR d.Meal2 = m.Meal_ID OR d.Meal3 = m.Meal_ID
    WHERE m.Allergens LIKE '%nuts%'
)
END;

EXEC Query8




--Query 9

CREATE PROCEDURE Query9
AS
BEGIN
SELECT *
FROM Member
WHERE Start_datee >= DATEADD(MONTH, -3, GETDATE())
END

EXEC Query9

--Query 10
  
CREATE PROCEDURE Query10
AS 
BEGIN

SELECT g.Gym_Name, COUNT(*) AS Total_Members
FROM Member
inner join Gym g ON g.Gym_ID=Member.Gym_ID
WHERE Start_datee >= DATEADD(MONTH, -6, GETDATE())
GROUP BY  g.Gym_Name
ORDER BY  g.Gym_Name

END
EXEC Query10

---- Additional 1
--- List of Diets containing fibre less then 20 grams


SELECT Diet_ID, Diet_Type
FROM (
    SELECT
        dt.Diet_ID,
        dt.Diet_Type,
        (
            SELECT
                SUM(CAST(REPLACE(REPLACE(REPLACE(m.Fibre, 'g', ''), ' ', ''), 'grams', '') AS FLOAT))
            FROM
                Meal m
            WHERE
                m.Meal_ID IN (dt.Meal1, dt.Meal2, dt.Meal3)
        ) AS TotalFibre
    FROM
        Diet dt
) AS DietCarbs
WHERE
    TotalFibre < 20;

----- Procedure
CREATE PROCEDURE Query11
AS
BEGIN
    SELECT Diet_ID, Diet_Type
    FROM (
        SELECT
            dt.Diet_ID,
            dt.Diet_Type,
            (
                SELECT
                    SUM(CAST(REPLACE(REPLACE(REPLACE(m.Fibre, 'g', ''), ' ', ''), 'grams', '') AS FLOAT))
                FROM
                    Meal m
                WHERE
                    m.Meal_ID IN (dt.Meal1, dt.Meal2, dt.Meal3)
            ) AS TotalFibre
        FROM
            Diet dt
    ) AS DietCarbs
    WHERE
        TotalFibre < 20;
END
EXEC Query11


---- Additional 2


--List of Trainers and their Feedback Messages:
SELECT T.Trainer_ID, P.F_name, P.L_Name, F.Messagee
FROM Trainer T
JOIN Person P ON T.Person_ID = P.Person_ID
JOIN FeedbackxOwnerxTrainerxMember F2 ON T.Trainer_ID = F2.Trainer_ID
JOIN Feedback F ON F2.Feedback_ID = F.Feedback_ID;

---- Procedure
CREATE PROCEDURE Query12
AS
BEGIN
    SELECT T.Trainer_ID, P.F_name, P.L_Name, F.Messagee
    FROM Trainer T
    JOIN Person P ON T.Person_ID = P.Person_ID
    JOIN FeedbackxOwnerxTrainerxMember F2 ON T.Trainer_ID = F2.Trainer_ID
    JOIN Feedback F ON F2.Feedback_ID = F.Feedback_ID;
END


EXEC Additional2

---- Additional 3
--Details of members across all gyms that follow a specific Workout plan.


SELECT 
    m.Member_ID,
    p.F_name AS First_Name,
    p.L_Name AS Last_Name,
    m.Gym_ID,
    m.Goals,
    m.Weightt AS Weight,
    m.Start_datee AS Start_Date,
    m.Height,
    m.Allergens,
    m.Statuss,
    w.Workout_Name  
FROM 
    Member m
JOIN 
    Person p ON m.Person_ID = p.Person_ID
JOIN 
    WorkOutPlanUsedBY dubm ON m.Member_ID = dubm.Member_ID
JOIN 
    Diet d ON dubm.Workout_ID = d.Diet_ID
JOIN
    Workout w ON dubm.Workout_ID = w.Workout_ID  -- Join with Workout table to get Workout_Name
WHERE 
    dubm.Workout_ID = 7 
    AND m.Gym_ID = 'G005';

----- Procedure
CREATE PROCEDURE Query13
    @Workout_ID nvarchar(50), 
    @Gym_ID nvarchar(50)
AS
BEGIN
    SELECT 
        m.Member_ID,
        p.F_name AS First_Name,
        p.L_Name AS Last_Name,
        m.Gym_ID,
        m.Goals,
        m.Weightt AS Weight,
        m.Start_datee AS Start_Date,
        m.Height,
        m.Allergens,
        m.Statuss,
        w.Workout_Name  -- Include Workout_Name from Workout table
    FROM 
        Member m
    JOIN 
        Person p ON m.Person_ID = p.Person_ID
    JOIN 
        WorkOutPlanUsedBY dubm ON m.Member_ID = dubm.Member_ID
    JOIN 
        Diet d ON dubm.Workout_ID = d.Diet_ID
    JOIN
        Workout w ON dubm.Workout_ID = w.Workout_ID  -- Join with Workout table to get Workout_Name
    WHERE 
        dubm.Workout_ID = @Workout_ID
        AND m.Gym_ID = @Gym_ID;
END

EXEC Additional3 '7', 'G005'


--- Additional 4
--- Total Gym Amount from members for each gym

SELECT
    py.Gym_ID,
    g.Gym_Name AS Gym,
    SUM(py.Amount) AS Total_Payment_Amount
FROM
    Payment py
JOIN
    Gym g ON py.Gym_ID = g.Gym_ID
GROUP BY
    py.Gym_ID, g.Gym_Name;

----- Procedure

CREATE PROCEDURE Query14
AS
BEGIN
    SELECT
        py.Gym_ID,
        g.Gym_Name AS Gym,
        SUM(py.Amount) AS Total_Payment_Amount
    FROM
        Payment py
    JOIN
        Gym g ON py.Gym_ID = g.Gym_ID
    GROUP BY
        py.Gym_ID, g.Gym_Name;
END

EXEC Additional4


--- Additional 5
----- List of members and their subscription Details
SELECT M.Member_ID, P.F_name, P.L_Name, S.Tier, S.Price
FROM Member M
JOIN Person P ON M.Person_ID = P.Person_ID
JOIN Subscription S ON M.Subscription = S.Subscription_ID;

--- Procedure

CREATE PROCEDURE Query15
AS
BEGIN
    SELECT M.Member_ID, P.F_name, P.L_Name, S.Tier, S.Price
    FROM Member M
    JOIN Person P ON M.Person_ID = P.Person_ID
    JOIN Subscription S ON M.Subscription = S.Subscription_ID;
END


EXEC Additional5


---- Additional 6

--- Trainers and their assicaited Gym
SELECT
    t.Trainer_ID,
    p.F_name AS Trainer_First_Name,
    p.L_Name AS Trainer_Last_Name,
    t.Rating,
    t.Experience,
    g.Gym_Name AS Associated_Gym
FROM
    Trainer t
JOIN
    Person p ON t.Person_ID = p.Person_ID
JOIN
    TrainerXGym tg ON t.Trainer_ID = tg.Trainer_ID
JOIN
    Gym g ON tg.Gym_ID = g.Gym_ID;

--- procedure

CREATE PROCEDURE Query16
AS
BEGIN
    SELECT
        t.Trainer_ID,
        p.F_name AS Trainer_First_Name,
        p.L_Name AS Trainer_Last_Name,
        t.Rating,
        t.Experience,
        g.Gym_Name AS Associated_Gym
    FROM
        Trainer t
    JOIN
        Person p ON t.Person_ID = p.Person_ID
    JOIN
        TrainerXGym tg ON t.Trainer_ID = tg.Trainer_ID
    JOIN
        Gym g ON tg.Gym_ID = g.Gym_ID;
END

EXEC Additional6


--- Additionl 7
 ---- Top 5 trainers with Most experience and rating
SELECT Top(5)
    t.Trainer_ID,
    p.F_name AS First_Name,
    p.L_Name AS Last_Name,
    p.Phone,
    t.Rating,
    CONCAT(t.Experience, ' years') AS Experience
 --   g.Gym_Name AS Gym
FROM
    Trainer t
JOIN
    Person p ON t.Person_ID = p.Person_ID

	order by t.experience  DESC;


----- Procedure


CREATE PROCEDURE Query17
AS
BEGIN
    SELECT TOP(5)
        t.Trainer_ID,
        p.F_name AS First_Name,
        p.L_Name AS Last_Name,
        p.Phone,
        t.Rating,
        CONCAT(t.Experience, ' years') AS Experience
    FROM
        Trainer t
    JOIN
        Person p ON t.Person_ID = p.Person_ID
    ORDER BY t.Experience DESC;
END


EXEC Additional7



--- Additional 8
---- List of Members Which didn't give any feedback yet
SELECT
    m.Member_ID,
    p.F_name AS Member_First_Name,
    p.L_Name AS Member_Last_Name
FROM
    Member m
JOIN
    Person p ON m.Person_ID = p.Person_ID
WHERE
    NOT EXISTS (
        SELECT 1
        FROM FeedbackxOwnerxTrainerxMember f
        WHERE f.Member_ID = m.Member_ID
    );

---- Procedure
CREATE PROCEDURE Query18
AS
BEGIN
    SELECT
        m.Member_ID,
        p.F_name AS Member_First_Name,
        p.L_Name AS Member_Last_Name
    FROM
        Member m
    JOIN
        Person p ON m.Person_ID = p.Person_ID
    WHERE
        NOT EXISTS (
            SELECT 1
            FROM FeedbackxOwnerxTrainerxMember f
            WHERE f.Member_ID = m.Member_ID
        );
END
EXEC Additional8


----- Additional 9
--Retrieve Member and Trainer Details for the deit plan currently assigned to members
SELECT
    m.Member_ID,
    p.F_name AS Member_First_Name,
    p.L_Name AS Member_Last_Name,
    t.Trainer_ID,
    tp.F_name AS Trainer_First_Name,
    tp.L_Name AS Trainer_Last_Name,
    d.Diet_ID,
    d.Diet_Type
FROM
    DietPlanUsedBY dp
JOIN
    Member m ON dp.Member_ID = m.Member_ID
JOIN
    Person p ON m.Person_ID = p.Person_ID
JOIN
    Trainer t ON dp.Trainer_ID = t.Trainer_ID
JOIN
    Person tp ON t.Person_ID = tp.Person_ID
JOIN
    Diet d ON dp.Diet_ID = d.Diet_ID;

----- Procedure

CREATE PROCEDURE Query19
AS
BEGIN
    SELECT
        m.Member_ID,
        p.F_name AS Member_First_Name,
        p.L_Name AS Member_Last_Name,
        t.Trainer_ID,
        tp.F_name AS Trainer_First_Name,
        tp.L_Name AS Trainer_Last_Name,
        d.Diet_ID,
        d.Diet_Type
    FROM
        DietPlanUsedBY dp
    JOIN
        Member m ON dp.Member_ID = m.Member_ID
    JOIN
        Person p ON m.Person_ID = p.Person_ID
    JOIN
        Trainer t ON dp.Trainer_ID = t.Trainer_ID
    JOIN
        Person tp ON t.Person_ID = tp.Person_ID
    JOIN
        Diet d ON dp.Diet_ID = d.Diet_ID;
END

EXEC Additional9

---- Additional 10
---- Member details with their gym
SELECT
    m.Member_ID,
    p.F_name AS First_Name,
    p.L_Name AS Last_Name,
    p.Phone,
    g.Gym_Name AS Gym,
    m.Goals,
    m.Weightt AS Weight,
    m.Height,
    m.Statuss
FROM
    Member m
JOIN
    Person p ON m.Person_ID = p.Person_ID
JOIN
    Gym g ON m.Gym_ID = g.Gym_ID;

------- Procedure


CREATE PROCEDURE Query20
AS
BEGIN
    SELECT
        m.Member_ID,
        p.F_name AS First_Name,
        p.L_Name AS Last_Name,
        p.Phone,
        g.Gym_Name AS Gym,
        m.Goals,
        m.Weightt AS Weight,
        m.Height,
        m.Statuss
    FROM
        Member m
    JOIN
        Person p ON m.Person_ID = p.Person_ID
    JOIN
        Gym g ON m.Gym_ID = g.Gym_ID;
END


EXEC Query20
