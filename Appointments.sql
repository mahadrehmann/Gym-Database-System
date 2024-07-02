select * from Appointment

exec MemberAvailableTrainers 'M004'
CREATE PROCEDURE MemberAvailableTrainers
	@Member_ID NVARCHAR(255)
As
Begin
	DECLARE @GymID NVARCHAR(10);
	select @GymID=M.Gym_ID from Member M where @Member_ID= M.Member_ID

	select T.Trainer_ID,Rating,Experience from Trainer T join TrainerXGym TG on T.Trainer_ID=TG.Trainer_ID AND TG.Gym_ID=@GymID
End


select * from Member

exec SetMemberAppointment 'M023','T001';

CREATE PROCEDURE SetMemberAppointment
	@Member_ID NVARCHAR(255),
    @Trainer_ID NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LastAppointment NVARCHAR(10);
    DECLARE @NewAppointmnet NVARCHAR(10);
    DECLARE @GymID NVARCHAR(10);

	select @GymID=M.Gym_ID from Member M where @Member_ID= M.Member_ID

    -- Get the last Person_ID
    SELECT TOP 1 @LastAppointment = Appointment_ID
    FROM Appointment
    ORDER BY Appointment_ID DESC;

    SET @NewAppointmnet = CONCAT('A', RIGHT('000' + CAST(RIGHT(@LastAppointment, 3) + 1 AS NVARCHAR(3)), 3));

 
    INSERT INTO Appointment(Appointment_ID,Gym_ID,Member_ID,[Trainer_ID],[Statuss])
    VALUES (@NewAppointmnet, @GymID, @Member_ID,@Trainer_ID,'Pending');
END


exec TrainerScheduleApproved 'T002'
CREATE PROCEDURE TrainerScheduleApproved
	@trainer_ID NVARCHAR(255)
As
Begin
	select M.Member_ID,Goals,Weightt,Height from Member M join Appointment A on A.Member_ID=M.Member_ID AND A.[Trainer_ID]=@trainer_ID AND A.[Statuss]='Approved'
End

exec TrainerSchedulePending 'T002'
CREATE PROCEDURE TrainerSchedulePending
	@trainer_ID NVARCHAR(255)
As
Begin
	select M.Member_ID,Goals,Weightt,Height from Member M join Appointment A on A.Member_ID=M.Member_ID AND A.[Trainer_ID]=@trainer_ID AND A.[Statuss]='Pending'
End

EXEC ApproveAppointment 'M001', 'T002'

CREATE PROCEDURE ApproveAppointment
	@member_ID NVARCHAR(255),
	@trainer_ID NVARCHAR(255)
As
Begin
	select M.Member_ID,Goals,Weightt,Height from Member M join Appointment A on A.Member_ID=M.Member_ID AND A.[Trainer_ID]=@trainer_ID AND A.[Statuss]='Approved'

	UPDATE Appointment
    SET [Statuss] = 'Approved'
    WHERE Appointment.[Trainer_ID]=@trainer_ID AND Appointment.Member_ID=@member_ID

End

exec DisapprovAppointment 'M006','T006'

CREATE PROCEDURE DisapprovAppointment
	@member_ID NVARCHAR(255),
	@trainer_ID NVARCHAR(255)
As
Begin
	select M.Member_ID,Goals,Weightt,Height from Member M join Appointment A on A.Member_ID=M.Member_ID AND A.[Trainer_ID]=@trainer_ID AND A.[Statuss]='Approved'

	UPDATE Appointment
    SET [Statuss] = 'Pending'
    WHERE Appointment.[Trainer_ID]=@trainer_ID AND Appointment.Member_ID=@member_ID

End


select F_name,L_Name,G.Gym_Name,G.Locationn,P.Age,P.Phone from Owner O join Person P on P.Person_ID=O.Person_ID join Gym G on G.Gym_ID=O.Gym_ID AND P.Statuss='Pending'



