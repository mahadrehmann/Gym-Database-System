CREATE PROCEDURE GetMembersByTrainer @TrainerID Nvarchar(255)
AS
BEGIN
    SELECT M.Member_ID, P.F_name, P.L_Name, P.DoB, P.Age, M.Gym_ID, M.Goals, M.Weightt, M.Start_datee, M.Height, M.Subscription, M.Allergens
    FROM Member M
    JOIN Person P ON M.Person_ID = P.Person_ID
    JOIN TrainerxMember MT ON M.Member_ID = MT.Member_ID
    WHERE MT.Trainer_ID = @TrainerID;
END;

EXEC GetMembersByTrainer 'T001';


select * from Admin 