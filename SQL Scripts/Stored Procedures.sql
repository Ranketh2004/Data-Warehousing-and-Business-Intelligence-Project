----create procedures for country, city, product category and products

create procedure dbo.UpdateDimCountry
@CountryId int,
@CountryName nvarchar(50),
@CountryCode nvarchar(50)
as
begin
if not exists (select CountrySk
from dbo.DimCountry
where AlternateCountryID = @CountryId)
begin
insert into DimCountry (AlternateCountryID, CountryName, CountryCode, InsertDate,ModifiedDate)
values (@CountryId, @CountryName, @CountryCode, GETDATE(), GETDATE())
end;
if exists (select CountrySk
from dbo.DimCountry
where AlternateCountryID = @CountryId)
begin
update dbo.DimCountry
set CountryName = @CountryName,
CountryCode = @CountryCode,
ModifiedDate = GETDATE()
where AlternateCountryID = @CountryId and (CountryName != @CountryName or CountryCode != @CountryCode)
end;
end;

create procedure dbo.UpdateDimCity
@CityId int,
@CityName nvarchar(50),
@zipcode nvarchar(50),
@CountryKey int
as
begin
if not exists(select CitySk
from dbo.DimCity
where AlternateCityID = @CityId)
begin
insert into DimCity (AlternateCityID, CityName, Zipcode, CountryKey, InsertDate, ModifiedDate)
values (@CityId, @CityName, @zipcode, @CountryKey, GETDATE(), GETDATE())
end;
if exists (select CitySk
from dbo.DimCity
where AlternateCityID = @CityId)
begin
update dbo.DimCity
set CityName = @CityName,
Zipcode = @zipcode,
CountryKey = @CountryKey,
ModifiedDate = GETDATE()
where AlternateCityID = @CityId and (CityName != @CityName or Zipcode != Zipcode or CountryKey != @CountryKey)
end;
end;

create procedure dbo.UpdateProdCategory
@CategoryId int,
@CategoryName nvarchar(50)
as
begin
if not exists(select ProductCategorySk
from dbo.DimProductCategory
where AlternateCategoryID = @CategoryId)
begin
insert into DimProductCategory (AlternateCategoryID, ProductCategoryName, InsertDate, ModifiedDate)
values (@CategoryId, @CategoryName, GETDATE(), GETDATE())
end;
if exists (select ProductCategorySk
from dbo.DimProductCategory
where AlternateCategoryID = @CategoryId)
begin
update dbo.DimProductCategory
set ProductCategoryName = @CategoryName,
ModifiedDate = GETDATE()
where AlternateCategoryID = @CategoryId and (ProductCategoryName != @CategoryName)
end;
end;

create procedure dbo.UpdateDimProduct
@ProductId int,
@ProductName nvarchar(50),
@UnitPrice money,
@CategoryKey int,
@ModifiedDate datetime,
@Resistant nvarchar(50),
@Allergic bit,
@VitalityDays int
as
begin
if not exists(select ProductSk
from dbo.DimProduct
where AlternateProductID = @ProductId)
begin
insert into DimProduct (AlternateProductID, ProductName, UnitPrice, CategoryKey, SrcModifiedDate, Resistant, IsAllergic, VitalityDays, InsertDate, ModifiedDate)
values (@ProductId, @ProductName, @UnitPrice, @CategoryKey, @ModifiedDate, @Resistant, @Allergic, @VitalityDays, GETDATE(), GETDATE());
end;
if exists(select ProductSk
from dbo.DimProduct
where AlternateProductID = @ProductId)
begin
update DimProduct
set ProductName = @ProductName, UnitPrice=@UnitPrice, CategoryKey=@CategoryKey, SrcModifiedDate = @ModifiedDate, 
Resistant = @Resistant, IsAllergic = @Allergic, VitalityDays = @VitalityDays, ModifiedDate = GETDATE()
where AlternateProductID = @ProductId and (ProductName != @ProductName or UnitPrice != UnitPrice or CategoryKey != @CategoryKey or SrcModifiedDate != @ModifiedDate
or Resistant != @Resistant or IsAllergic != @Allergic or VitalityDays != @VitalityDays)
end;
end;


create procedure dbo.UpdateEmployee
@EmployeeId int,
@FirstName nvarchar(50),
@MiddleInitial nvarchar(50),
@LastName nvarchar(50),
@BirthDate datetime,
@Gender nvarchar(50),
@CityKey int,
@HireDate datetime,
@WorkDays int
as
begin
if not exists( select EmployeeSk
from DimEmployee
where AlternateEmployeeID = @EmployeeId)
begin
insert into DimEmployee (AlternateEmployeeID, FirstName, MiddleInitial, LastName, DateOfBirth, Gender, CityKey, HireDate, DaysOfWorks, InsertDate, ModifiedDate)
values (@EmployeeId, @FirstName, @MiddleInitial, @LastName, @BirthDate, @Gender, @CityKey, @HireDate, @WorkDays,GETDATE(), GETDATE())
end;
if exists(select EmployeeSk
from DimEmployee
where AlternateEmployeeID = @EmployeeId)
begin
update DimEmployee
set FirstName = @FirstName, MiddleInitial = @MiddleInitial, LastName = @LastName, DateOfBirth=@BirthDate, Gender=@Gender, CityKey=@CityKey, HireDate=@HireDate
where AlternateEmployeeID = @EmployeeId and (FirstName !=@FirstName  or MiddleInitial != @MiddleInitial or LastName != @LastName or DateOfBirth != @BirthDate
or Gender != @Gender or CityKey != @CityKey or HireDate != @HireDate or DaysOfWorks != @WorkDays)
end;
end;

drop procedure dbo.UpdateEmployee;