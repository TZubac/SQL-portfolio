use AdventureWorks2016
go

select * from Production.Product

--1.Select first and last name from Person.Person as one name in ascending order

select FirstName +' '+ LastName as name from Person.Person order by FirstName,LastName asc

--2.Select first 3 names from table Person.Person in ascending order

select top 3 FirstName+' '+LastName as name from Person.Person order by name

--3. Select safetystocklevel from Production.Product where value is equal to 1000

select * from Production.Product where SafetyStockLevel=1000

--4. Update table Person.StateProvince for name Alberta. Change Country region code from CA to AS

Update Person.StateProvince
Set CountryRegionCode='AS' where Name='Alberta' and StateProvinceID=1

select* from Person.StateProvince

--5.Display unique CountryRegionCode in table Person.StateProvince

Select distinct CountryRegionCode from Person.StateProvince

--6.Display a number of unique CountryRegionCode in table Person.StateProvince

Select count(distinct CountryRegionCode) from Person.StateProvince

--7. Display employee whose name begin with Ke characters

select* from Person.Person where FirstName like 'Ke%'

select * from Person.Person

--8. Select Employees with hightest to lowest sales bonus from table Sales.SalesPerson

select * from Sales.SalesPerson order by Bonus desc
select * from Sales.SalesPerson

--9. Display the number of female and male employees from table HumanResources.Employee group by gender

SELECT Gender, COUNT(*) AS TotalEmployees
FROM HumanResources.Employee
GROUP BY Gender;
select * from HumanResources.Employee

--10. Display min,avg and max price from table ProductCostHistory

select min(StandardCost) from Production.ProductCostHistory
select avg(StandardCost) from Production.ProductCostHistory
select max(StandardCost) from Production.ProductCostHistory

select * from Production.ProductCostHistory

--11. Create table Shippers which include following columns: ShipperID, ShipperName, Phone

create table Shippers(
ShippersID int not null,
ShipperName varchar (15) not null,
Phone int  not null)
go


--12. Fill the table Shippers with some certain values

insert into Shippers( ShippersID, ShipperName,Phone)
values (1,'Speedy Express', 1234),
       (2,'UnitedPackage', 3344),
	   (3,'Federal Shiping',2255)
go

select * from Shippers

--13. In table Shippers add column Country and type some values

alter table Shippers
add Country varchar (15)

update Shippers
Set Country='USA'
go

/*14. Show the name and surname of the employee, as well as how long that employee was absent from work due to vacation, due to illness, and in total.
Tables needed to solve: HumanResources.Employee, Person.Perso */

SELECT P.FirstName, P.LastName, VacationHours, SickLeaveHours, VacationHours + SickLeaveHours AS TotalLeaveHours FROM HumanResources.Employee as E
INNER JOIN Person.Person as P ON E.BusinessEntityID = P.BusinessEntityID

