
------------------------------------------------------------------------------------------------------------


EXEC InsertFeedBackTrainer 'M001','Good man!';

select * from Feedback
select * from FeedbackxOwnerxTrainerxMember


create Procedure InsertFeedBackTrainer
@Member_ID Nvarchar(255),
@Description Nvarchar(255)

As
Begin

	Declare @Trainer_ID Nvarchar(255)
	DECLARE @Gym_ID nvarchar(255)
	Declare @Gym_Owner nvarchar(255)

	select @Trainer_ID=MT.Trainer_ID from Member M join TrainerxMember MT on M.Member_ID=MT.Member_ID  AND M.Member_ID=@Member_ID;
	select  @Gym_ID=M.Gym_ID from Member M join Person P on M.Person_ID=P.Person_ID where M.Member_ID=@Member_ID
	select @Gym_Owner=O.Owner_ID from Owner O where O.Gym_ID=@Gym_ID

	Declare @LastFeedback Nvarchar(255)
   -- Get the last Person_ID
    SELECT TOP 1 @LastFeedback = Feedback_ID
    FROM Feedback
    ORDER BY Feedback_ID DESC;
	Declare @newFeedbackID nvarchar(255)
    -- Increment the last ID to get the next available ID
    SET @newFeedbackID = CONCAT('F', RIGHT('000' + CAST(RIGHT(@LastFeedback, 3) + 1 AS NVARCHAR(3)), 3));
	

	INSERT INTO Feedback(Feedback_ID, Messagee, Rating,Given_By)
    VALUES (@newFeedbackID, @Description, ' ','Trainer');

	INSERt into FeedbackxOwnerxTrainerxMember(Feedback_ID,Owner_ID,Trainer_ID,Member_ID)
	values (@newFeedbackID,@Gym_Owner,@Trainer_ID,@Member_ID)

End


EXEC InsertFeedBackMember 'M001','NIce goo man!', '4.5';


create Procedure InsertFeedBackMember 
@Member_ID Nvarchar(255),
@Description Nvarchar(255),
@Rating Nvarchar(255)

As
Begin

	DECLARE @Role NVARCHAR(255)
	Declare @Trainer_ID Nvarchar(255)
	DECLARE @Gym_ID nvarchar(255)
	Declare @Gym_Owner nvarchar(255)

	select @Trainer_ID=MT.Trainer_ID from Member M join TrainerxMember MT on M.Member_ID=MT.Member_ID  AND M.Member_ID=@Member_ID;
	select  @Gym_ID=M.Gym_ID,@Role=  P.Rolee from Member M join Person P on M.Person_ID=P.Person_ID where M.Member_ID=@Member_ID
	select @Gym_Owner=O.Owner_ID from Owner O where O.Gym_ID=@Gym_ID

	Declare @LastFeedback Nvarchar(255)
   -- Get the last Person_ID
    SELECT TOP 1 @LastFeedback = Feedback_ID
    FROM Feedback
    ORDER BY Feedback_ID DESC;
	Declare @newFeedbackID nvarchar(255)
    -- Increment the last ID to get the next available ID
    SET @newFeedbackID = CONCAT('F', RIGHT('000' + CAST(RIGHT(@LastFeedback, 3) + 1 AS NVARCHAR(3)), 3));
	

	INSERT INTO Feedback(Feedback_ID, Messagee, Rating,Given_By)
    VALUES (@newFeedbackID, @Description, @Rating,@Role);

	INSERt into FeedbackxOwnerxTrainerxMember(Feedback_ID,Owner_ID,Trainer_ID,Member_ID)
	values (@newFeedbackID,@Gym_Owner,@Trainer_ID,@Member_ID)

End



---------------------------------------------------------------------------------------------------------------------------------------

exec DisplayTrainerofMembers 'M001';

create Procedure DisplayTrainerofMembers 
@Member_ID nvarchar(255)
As
Begin
select T.Trainer_ID,F_name,L_Name,Age,Addresss,Rating,Experience from Trainer T join TrainerxMember MT on T.Trainer_ID=MT.Trainer_ID join Person P on P.Person_ID=T.Person_ID where MT.Member_ID=@Member_ID
end

exec DisplayMembersofTrainer 'T001';
create Procedure DisplayMembersofTrainer 
@Member_ID nvarchar(255)
As
Begin
select M.Member_ID,F_name,L_Name,Age,Addresss,Weightt,Height,Goals from Member M join TrainerxMember MT on M.Member_ID=MT.Member_ID join Person P on P.Person_ID=M.Person_ID where MT.Trainer_ID=@Member_ID
end
