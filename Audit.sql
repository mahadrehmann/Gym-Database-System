CREATE TABLE Audit_trail (
    Audit_ID INT PRIMARY KEY,
    Timestamp DATETIME ,
    ID NVARCHAR(255),
    OperationType NVARCHAR(255),
    TableName NVARCHAR(255),
    OperationDetails NVARCHAR(255)
);
select * from Audit_trail


CREATE TRIGGER trg_InsertDietAudit
ON Diet
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewAudit_ID NVARCHAR(255);

    -- Get the last Audit_ID and increment it for the new entry
    SELECT TOP 1 @NewAudit_ID = Audit_ID
    FROM Audit_trail
    ORDER BY Audit_ID DESC;

    -- If no records exist, set the new Audit_ID to 1, otherwise increment the last ID
    IF @NewAudit_ID IS NULL
    BEGIN
        SET @NewAudit_ID = '1';
    END
    ELSE
    BEGIN
        SET @NewAudit_ID = CAST((CAST(@NewAudit_ID AS INT) + 1) AS NVARCHAR(255));
    END;

    -- Insert the new audit record
    INSERT INTO Audit_trail (Audit_ID, Timestamp,ID, OperationType, TableName, OperationDetails)
    SELECT @NewAudit_ID, GETDATE(), inserted.Diet_ID,'INSERT', 'Diet', 'New Diet Plan Created'
    FROM inserted;
END;



CREATE TRIGGER trg_InsertMemberAudit
ON Member
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewAudit_ID NVARCHAR(255);

    -- Get the last Audit_ID and increment it for the new entry
    SELECT TOP 1 @NewAudit_ID = Audit_ID
    FROM Audit_trail
    ORDER BY Audit_ID DESC;

    -- If no records exist, set the new Audit_ID to 1, otherwise increment the last ID
    IF @NewAudit_ID IS NULL
    BEGIN
        SET @NewAudit_ID = '1';
    END
    ELSE
    BEGIN
        SET @NewAudit_ID = CAST((CAST(@NewAudit_ID AS INT) + 1) AS NVARCHAR(255));
    END;

    -- Insert the new audit record
    INSERT INTO Audit_trail (Audit_ID, Timestamp,ID, OperationType, TableName, OperationDetails)
    SELECT @NewAudit_ID, GETDATE(), inserted.Person_ID,'INSERT', 'Member', 'Member is waiting for approval'
    FROM inserted;
END;

create TRIGGER trg_InsertTrainerAudit
ON Trainer
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewAudit_ID NVARCHAR(255);

    -- Get the last Audit_ID and increment it for the new entry
    SELECT TOP 1 @NewAudit_ID = Audit_ID
    FROM Audit_trail
    ORDER BY Audit_ID DESC;

    -- If no records exist, set the new Audit_ID to 1, otherwise increment the last ID
    IF @NewAudit_ID IS NULL
    BEGIN
        SET @NewAudit_ID = '1';
    END
    ELSE
    BEGIN
        SET @NewAudit_ID = CAST((CAST(@NewAudit_ID AS INT) + 1) AS NVARCHAR(255));
    END;

    -- Insert the new audit record
    INSERT INTO Audit_trail (Audit_ID, Timestamp,ID, OperationType, TableName, OperationDetails)
    SELECT @NewAudit_ID, GETDATE(), inserted.Person_ID,'INSERT', 'Trainer', 'Trainer is waiting for approval'
    FROM inserted;
END;

CREATE TRIGGER trg_InsertOwnerAudit
ON Owner
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewAudit_ID NVARCHAR(255);

    -- Get the last Audit_ID and increment it for the new entry
    SELECT TOP 1 @NewAudit_ID = Audit_ID
    FROM Audit_trail
    ORDER BY Audit_ID DESC;

    -- If no records exist, set the new Audit_ID to 1, otherwise increment the last ID
    IF @NewAudit_ID IS NULL
    BEGIN
        SET @NewAudit_ID = '1';
    END
    ELSE
    BEGIN
        SET @NewAudit_ID = CAST((CAST(@NewAudit_ID AS INT) + 1) AS NVARCHAR(255));
    END;

    -- Insert the new audit record
    INSERT INTO Audit_trail (Audit_ID, Timestamp,ID, OperationType, TableName, OperationDetails)
    SELECT @NewAudit_ID, GETDATE(), inserted.Person_ID,'INSERT', 'Owner', 'Owner is waiting for Gym approval'
    FROM inserted;
END;


CREATE TRIGGER trg_UpdateRoleeAudit
ON Person
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @NewAudit_ID INT;

    -- Get the last Audit_ID and increment it for the new entry
    SELECT TOP 1 @NewAudit_ID = Audit_ID
    FROM Audit_trail
    ORDER BY Audit_ID DESC;

    -- If no records exist, set the new Audit_ID to 1, otherwise increment the last ID
    IF @NewAudit_ID IS NULL
    BEGIN
        SET @NewAudit_ID = 1;
    END
    ELSE
    BEGIN
        SET @NewAudit_ID = @NewAudit_ID + 1;
    END;

	 DECLARE @Person_ID NVARCHAR(255);

    -- Get the primary key of the updated row from the INSERTED table
    SELECT @Person_ID = Person_ID
    FROM INSERTED;

    -- Insert the audit record into Audit_trail table
    INSERT INTO Audit_trail (Audit_ID, Timestamp, ID, OperationType, TableName, OperationDetails)
    VALUES (@NewAudit_ID, GETDATE(), @Person_ID, 'UPDATE', 'Person', 'Status Updated');
END;