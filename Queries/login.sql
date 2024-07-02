EXEC GetRoleByUsernameAndPassword 'Admin', 'Admin1234';

drop Procedure GetRoleByUsernameAndPassword

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
    FROM Person  -- Replace YourTableName with the actual name of your table
    WHERE Username = @inputUsername AND Passwordd = @inputPassword AND Person.Statuss='Approved';

    -- Return the rolee if both match
    IF (@Rolee IS NOT NULL)
    BEGIN
        SELECT @Rolee AS Rolee;
    END
    ELSE
    BEGIN
        PRINT 'No matching record found.';
    END
END;

CREATE PROCEDURE GetUserIDByUsernameAndPassword (
    @inputUsername NVARCHAR(50),
    @inputPassword NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Rolee NVARCHAR(50);
    DECLARE @PersonID NVARCHAR(50);

    -- Check if the username and password match and get the Person_ID
    SELECT @PersonID = Person_ID, @Rolee = Rolee
    FROM Person 
    WHERE Username = @inputUsername AND Passwordd = @inputPassword AND Statuss = 'Approved';

    -- Return the Person_ID if a matching record is found
    IF (@PersonID IS NOT NULL)
    BEGIN
        -- Check if the user is a member
        IF (@Rolee = 'Member')
        BEGIN
            DECLARE @MemberID NVARCHAR(50);
            -- Get the Member_ID
            SELECT @MemberID = Member_ID
            FROM Member 
            WHERE Person_ID = @PersonID;

            IF (@MemberID IS NOT NULL)
            BEGIN
                SELECT @MemberID AS UserID;
                RETURN;
            END
        END
        -- Check if the user is an owner
        ELSE IF (@Rolee = 'Owner')
        BEGIN
            DECLARE @OwnerID NVARCHAR(50);
            -- Get the Owner_ID
            SELECT @OwnerID = Owner_ID
            FROM Owner 
            WHERE Person_ID = @PersonID;

            IF (@OwnerID IS NOT NULL)
            BEGIN
                SELECT @OwnerID AS UserID;
                RETURN;
            END
        END
        -- Check if the user is a trainer
        ELSE IF (@Rolee = 'Trainer')
        BEGIN
            DECLARE @TrainerID NVARCHAR(50);
            -- Get the Trainer_ID
            SELECT @TrainerID = Trainer_ID
            FROM Trainer 
            WHERE Person_ID = @PersonID;

            IF (@TrainerID IS NOT NULL)
            BEGIN
                SELECT @TrainerID AS UserID;
                RETURN;
            END
        END
    END

    -- If no matching record is found or the user is not member/owner/trainer, return NULL
    PRINT 'No matching record found.';
END;

