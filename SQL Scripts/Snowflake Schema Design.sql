drop table if exists DimProductCategory;
create table DimProductCategory(
	ProductCategorySK int identity(1,1) primary key,
	AlternateCategoryID int,
	ProductCategoryName nvarchar(50),
	InsertDate datetime,
	ModifiedDate datetime
);

drop table if exists DimCountry;
create table DimCountry(
	CountrySK int identity(1,1) primary key,
	AlternateCountryID int,
	CountryName nvarchar(50),
	CountryCode nvarchar(20),
	InsertDate datetime,
	ModifiedDate datetime
);

select *  from DimCountry;

drop table if exists DimCity;
create table DimCity(
	CitySk int identity(1,1) primary key,
	AlternateCityID int,
	CityName nvarchar(50),
	Zipcode nvarchar(50),
	CountryKey int foreign key references DimCountry(CountrySK),
	InsertDate datetime,
	ModifiedDate datetime
);

select * from DimCity;

drop table if exists DimCustomer;
create table DimCustomer(
	CustomerSk int identity(1,1) primary key,
	AlternateCustomerID int,
	FirstName nvarchar(50),
	MiddleInitial nvarchar(50),
	LastName nvarchar(50),
	CityKey int foreign key references DimCity(CitySk),
	Address nvarchar(50),
	StartDate	datetime,
	EndDate		datetime,
	InsertDate datetime, 
	ModifiedDate datetime
);

select * from DimCustomer;

drop table if exists DimEmployee;
create table DimEmployee(
	EmployeeSk int identity(1,1) primary key,
	AlternateEmployeeID int,
	FirstName nvarchar(50),
	MiddleInitial nvarchar(50),
	LastName nvarchar(50),
	DateOfBirth datetime,
	Gender nvarchar(50),
	CityKey int foreign key references DimCity(CitySk),
	HireDate datetime,
	InsertDate datetime,
	ModifiedDate datetime
);

select * from DimEmployee

drop table if exists DimProduct;
create table DimProduct(
	ProductSk int identity(1,1) primary key,
	AlternateProductID int,
	ProductName nvarchar(50),
	UnitPrice money,
	CategoryKey int foreign key references DimProductCategory(ProductCategorySK),
	SrcModifiedDate datetime,
	Resistant nvarchar(50),
	IsAllergic bit,
	VitalityDays int,
	InsertDate datetime,
	ModifiedDate datetime
);

select * from DimProduct;

drop table if exists FactSales;
create table FactSales(
	SalesID int,
	SalesPersonKey int foreign key references DimEmployee(EmployeeSk),
	CustomerKey int foreign key references DimCustomer(CustomerSk),
	ProductKey int foreign key references DimProduct(ProductSk),
	Quantity smallint,
	Discount decimal(5,2),
	TotalPrice money,
	SalesDateKey int foreign key references DimDate(DateKey),
	TransactionNumber nvarchar(50),
	InsertDate datetime,
	ModifiedDate datetime
);

select * from FactSales;