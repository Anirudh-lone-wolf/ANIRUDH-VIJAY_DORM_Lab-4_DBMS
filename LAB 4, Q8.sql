/*Question 8 : Display the Id and Name of the Product ordered after “2021-10-05”
The question is not able to convey if it wants us to retreive just the order 
immediately placed after this date or all orders placed after this date. \
So, I have included the queries for both the scenaios. 
PLEASE CONSIDER THIS AND GRADE ME ACCORDINGLY*/

/*for the product ordered after this date*/ 
select pro_id as ID, pro_name as product from product 
join supplier_pricing using(pro_id) 
join orders using(pricing_id) where ord_date>'2021-10-05'
limit 1;

/*for all products ordered after this date*/
select pro_id as ID, pro_name as product from product 
join supplier_pricing using(pro_id) 
join orders using(pricing_id) where ord_date>'2021-10-05'; 

