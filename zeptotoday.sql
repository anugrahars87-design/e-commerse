--Found top 10 best-value products based on discount percentage
select name,discountselling,discountpercent from zepto
order by discountpercent desc
limit 10

--Identified high-MRP products that are currently out of stock

select name,max(mrp) as highestmrp from zepto
where outofstock =TRUE
group by  name
order by max(mrp) desc 

--Estimated potential revenue for each product category
select category,sum (discountselling *availablequantity) as potentialrevenue from zepto
group by category
order by potentialrevenue desc

--Filtered expensive products (MRP > ₹500) with minimal discount
select name,mrp,min(discountpercent) as mindiscount from zepto
where mrp > 500
group by  name,mrp
order by mrp desc ,mindiscount desc

--Ranked top 5 categories offering highest average discounts

select  category, avg(discountpercent) avgdiscount from zepto
group by  category
order by avg(discountpercent) desc
limit 5

--Calculated unit price per gram to identify value-for-money products(per products)

select name,discountselling,weightingms, discountselling/weightingms as pricepergrm from zepto
where weightingms >0
order by pricepergrm asc --asc cause cheepest gram =best value


--Calculated stockprice per gram to identify value-for-money products(whole purchased product)
select name,price,weightingms, price/weightingms as stockpricepergrm from zepto
where weightingms >0
order by stockpricepergrm asc


--Grouped products based on weight into Low, Medium, and Bulk categories

select name,weightingms,
case
   when weightingms <2000  then 'low'
   when weightingms between 2000 and 8000 then 'mediam'
else 'bulk'
end as groupbyweight
from zepto

--Measured total inventory weight per product category

select name,sum(weightingms * availablequantity) as totalinventoryweight from zepto ---total stock weight,sum same name entries
group by name
order by totalinventoryweight desc
