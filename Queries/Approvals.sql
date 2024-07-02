SELECT * FROM Person 
SELECT * FROM Member 
select * from Trainer 

exec ShowPendingTrainerMember;
create Procedure ShowPendingTrainerMember
As
Begin
select * from Person  where Statuss='Pending' AND (Rolee='Trainer' OR Rolee='Member')
End

exec ShowPendingGym;

create Procedure ShowPendingGym
As
Begin
select * from Person  where Statuss='Pending' AND Rolee='Owner'
End

CREATE PROCEDURE ApproveStatusByID (
    @PersonID NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Statuss column to 'Approved' for the specified Person_ID
    UPDATE Person 
    SET Statuss = 'Approved'
    WHERE Person_ID = @PersonID;
END

CREATE PROCEDURE CancelStatusByID (
    @PersonID NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Statuss column to 'Approved' for the specified Person_ID
    UPDATE Person 
    SET Statuss = 'Pending'
    WHERE Person_ID = @PersonID;
END



--------------------------ADMIN APPROVALS----------------------------------------------

select P.Person_ID,F_name,L_Name,G.Gym_Name,G.Locationn,P.Age,P.Phone from Owner O join Person P on P.Person_ID=O.Person_ID join Gym G on G.Gym_ID=O.Gym_ID AND P.Statuss='Pending' 
select P.Person_ID,F_name,L_Name,G.Gym_Name,G.Locationn,P.Age,P.Phone from Owner O join Person P on P.Person_ID=O.Person_ID join Gym G on G.Gym_ID=O.Gym_ID AND P.Statuss='Approved' 

exec ApproveGym 'P002'
CREATE PROCEDURE ApproveGym (
    @PersonID NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Statuss column to 'Approved' for the specified Person_ID
    UPDATE Person
    SET Statuss = 'Approved'
    WHERE Person_ID = @PersonID;
END

CREATE PROCEDURE DisApproveGym (
    @PersonID NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Statuss column to 'Approved' for the specified Person_ID
    UPDATE Person
    SET Statuss = 'Pending'
    WHERE Person_ID = @PersonID;
END



