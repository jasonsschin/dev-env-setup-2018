
-- Kill all open sessions for a database
USE [master];

DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('Core')

EXEC(@kill);

-- Find all table foreign keys
--EXEC sp_fkeys 'UserToEventToCommunicationTemplateToCustomer' 

--Delete all 

USE fileactive
BEGIN TRY
    BEGIN TRANSACTION 

	DELETE [AuthorizationRequest]
	DELETE dbo.FileDefinitionStatisticsGeneral
	DELETE FileDefinitionStatisticsPayments
	DELETE FileDefinitionStatisticsReceivables
	DELETE FileTracking
	DELETE TaskFileDefinitionToContent
	DELETE TaskFileDefinition
	DELETE PaymentTracking
	DELETE SubTask
	DELETE TaskHash
	DELETE Task

    COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK
END CATCH



