/*Question 6 : Display the Supplier details who can supply more than one product*/

select s.*, count(distinct pr.pro_id) as products from
supplier s join supplier_pricing sp using(supp_id) 
join product pr using(pro_id) 
group by s.SUPP_ID having count(distinct pr.PRO_ID)>1;


