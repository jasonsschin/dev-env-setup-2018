use core

declare @username nvarchar(max)
declare @firstName nvarchar(max)
declare @lastName nvarchar(max)
declare @email nvarchar(max)
declare @applicationName nvarchar(max)
declare @groupName nvarchar(max)
declare @passwordHash nvarchar(max)
declare @userToApplicationId int
declare @groupId int
declare @applicationId int
declare @userId int
declare @timeZoneId int
declare @viewAllRegions bit
declare @viewAllCustomers bit
declare @userTypeId int
declare @internal bit



set @username = 'fa_Webadmin'
set @passwordHash = 'AE8x0MHFElRPHlje/YifXsgzx2GoaE8YqJ2oMHimV4n1T4S7qoI0iHfl2aM1j6nT8Q==' --'Password1'

set @firstName = 'Jason'
set @lastName = 'Chin'
set @email = 'jchin@anzgcis.com'
set @timeZoneId = 89 -- AUS Eastern Standard Time
set @viewAllCustomers = 1
set @viewAllRegions = 1
set @userTypeId = 1 -- GCIS User
set @internal = 1

set @applicationName = 'PSI'
set @groupName = 'InternalWebAdmin'


if(not exists(select Id from [User] where UserName = @username)) begin

	insert into [User] (UserTypeId, FirstName, LastName, UserName, Email, IsInternal, ViewAllCustomers, ViewAllRegions, TimeZoneId, ModifiedBy, ModifiedOn, Created)
	values (@userTypeId, @firstName, @lastName, @username, @email, @internal, @viewAllCustomers, @viewAllRegions, @timeZoneId, 'system', getutcdate(), getutcdate())

end

select @userId = Id from [User] where UserName = @username

if(not exists(select UserId from UserAuthentication where UserId = @userId))
begin
	insert into UserAuthentication (UserId, PasswordHash, PasswordNeverExpires, Inactive, LockoutEnabled, AccessFailedCount, ModifiedBy, ModifiedOn, CreatedBy, CreatedOn)
	values (@userId, @passwordHash, 1, 0, 0, 0, 'system', getutcdate(), 'system', getutcdate())
end else begin
	update UserAuthentication set PasswordHash = @passwordHash, Inactive = 0, PasswordNeverExpires = 1 where UserId = @userId
end

select @applicationId = Id from [Application] where ApplicationName = @applicationName

if(not exists(select Id from UserToApplication where UserId = @userId and ApplicationId = @applicationId))
begin
	insert into UserToApplication (ApplicationId, UserId, Active, ModifiedBy, ModifiedOn, Created)
	values (@applicationId, @userId, 1, 'system', getutcdate(), getutcdate())
end

select @userToApplicationId = Id from UserToApplication where ApplicationId = @applicationId and UserId = @userId

select @groupId = Id from [Group] where ApplicationId = @applicationId and [Name] = @groupName



if(not exists (select Id from UserToApplicationToGroup where UserToApplicationId = @userToApplicationId and GroupId =  @groupId))
begin
	insert into UserToApplicationToGroup (UserToApplicationId, GroupId, ModifiedBy, ModifiedOn, Created)
    values (@userToApplicationId, @groupId, 'system', getutcdate(), getutcdate())
end

select 
UTA.Id,
U.UserName, 
A.ApplicationName,
G.Name as GroupName
from UserToApplication UTA
inner join [Application] A on UTA.ApplicationId = A.Id
inner join [User] U on U.Id = UTA.UserId
left join UserToApplicationToGroup UTATG on UTATG.UserToApplicationId = UTA.Id
left join [Group] G on UTATG.GroupId = G.Id
where U.UserName = @username

GO



