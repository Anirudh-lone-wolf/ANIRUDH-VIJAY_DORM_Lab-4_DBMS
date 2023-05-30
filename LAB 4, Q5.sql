/*Question 5 :  Display all the orders along with product name ordered by 
a customer having Customer_Id=2*/

select ord_id as orders, pro_name as product 
from customer join orders using (cus_id)
join supplier_pricing using(pricing_id) join product using(pro_id)
where cus_id=2;