select * from [user]
select * from [UserAuthentication]
select * from UserToApplication
select * from [UserToEventToCommunicationTemplate]
select * from  UserToEventToCommunicationTemplateToCustomer
select * from [dbo].[UserToApplicationToGroup]
select * from [dbo].[UserAccessAudit]
select * from [dbo].[Group]

truncate table UserToEventToCommunicationTemplateToCustomerToFileDefinition
truncate table  UserToEventToCommunicationTemplateToCustomer
truncate table [UserToEventToCommunicationTemplate]
truncate table [dbo].[UserAccessAudit]
truncate table [dbo].[UserPasswordHistory]
delete [dbo].[UserToApplicationToGroup] where id > 8
delete dbo.[UserToApplication] where id > 9
delete UserAuthentication where Userid > 9
delete dbo.[User] where id > 9

DBCC CHECKIDENT ('Group', RESEED, 12;
DBCC CHECKIDENT ('UserAccessAudit', RESEED, 1);
DBCC CHECKIDENT ('UserPasswordHistory', RESEED, 1);  
DBCC CHECKIDENT ('User', RESEED, 9);  
DBCC CHECKIDENT ('UserToApplication', RESEED, 9);   
DBCC CHECKIDENT ('UserToApplicationToGroup', RESEED, 8);  

update [Core].[dbo].[DualAuthRequestType] set AllowAutoApprove = 1


-- Reset password for user (to Password1)
UPDATE ua
SET ua.PasswordHash='ALCl5G5Cvxg/PsMB05j8zuoaI5hcbvR9A2Cpc5g5OVq6CthSlZgm2FH44SFoV5rNzA==',
  ua.PasswordNeverExpires=1,
  ua.LockoutEnabled=0,
  ua.Inactive=0,
  ua.AccessFailedCount = 0
FROM Core..UserAuthentication ua INNER JOIN Core..[User] u ON ua.UserId=u.Id
WHERE u.UserName = 'jchina'
