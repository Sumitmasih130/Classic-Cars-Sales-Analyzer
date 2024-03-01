delimiter //
create procedure business_kpis()
begin
drop table if exists business_table;
create table classicmodels.business_table
as
select Cs.country,count(distinct Cs.customerNumber) Total_Customer,count(Od.orderNumber) Total_Orders,sum(Ord.quantityOrdered * Ord.priceEach) as Revenue
 from classicmodels.customers Cs
 inner join
 classicmodels.orders Od
 on Cs.customerNumber = Od.customerNumber
 inner join
 classicmodels.orderdetails Ord
 on Od.orderNumber = Ord.orderNumber
 group by Cs.country;
 end //
 delimiter ;
 
 call business_kpis();
 
select * from classicmodels.business_table;

 drop procedure business_kpis;
 