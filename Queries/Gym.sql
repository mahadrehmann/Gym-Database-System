
create Procedure ShowMembersAtAGym @Owner_ID Nvarchar(255)
As
Begin
	DECLARE @New_Gym_ID NVARCHAR(10);

    SELECT @New_Gym_ID = Gym_ID
    FROM Owner 
    where @Owner_ID=Owner_ID

	select P.Person_ID,F_Name,L_Name,Allergens,Addresss,Age,Phone,Goals from Member  M Join Person  P on P.Person_ID=M.Person_ID where M.Gym_ID=@New_Gym_ID AND p.Statuss='Approved'
End

create Procedure ShowTrainerAtAGym @Owner_ID Nvarchar(255)
As
Begin
	DECLARE @New_Gym_ID NVARCHAR(10);

    SELECT @New_Gym_ID = Gym_ID
    FROM Owner 
    where @Owner_ID=Owner_ID

	select p.Person_ID,F_name,L_Name,Phone,Addresss,Age,Rating,Experience from Trainer  T join TrainerXGym  TM on T.Trainer_ID=tm.Trainer_ID JOIN Gym  G ON G.Gym_ID=TM.Gym_ID JOIN Person  P ON P.Person_ID=T.Person_ID AND G.Gym_ID=@New_Gym_ID and P.Statuss='Approved'

End


Exec ShowRevenew
create Procedure ShowRevenew 
As
Begin
	SELECT
		SUM(py.Amount) 
	FROM
		Payment  py
	JOIN
		Gym  g ON py.Gym_ID = g.Gym_ID join Owner  O on g.Gym_ID=O.Gym_ID
	GROUP BY
		py.Gym_ID, g.Gym_Name;
End


CREATE PROCEDURE GetMembersOfGym @Owner_ID Nvarchar(255)
AS
BEGIN
    SELECT * from Person  P join Member  M on P.Person_ID=M.Person_ID where M.Gym_ID='O001'
    
END;

EXEC GetMembersByTrainer 'T001';

SELECT * FROM Gym 
select * from Trainer 
SELECT * FROM Person 
SELECT * FROM TrainerXGym 
SELECT * FROM Owner 
SELECT * FROM Member 