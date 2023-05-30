/*Question 6 : Create a stored procedure to display supplier id, name, 
Rating(Average rating of all the products sold by every supplier) and 
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,
If rating >4 print “Good Service”, If rating >2 print “Average Service” else 
print “Poor Service”. Note that there should be one rating per supplier.*/

DELIMITER //
create procedure SupplierRatings()
begin
	select s.supp_id, s.supp_name, avg(r.rat_ratstars) as AVERAGE_RATING,
		case 
			when avg(r.rat_ratstars) = 5 then 'Excellent Service'
			when avg(r.rat_ratstars) > 4 then 'Good Service'
			when avg(r.rat_ratstars) > 2 then 'Average Service'
			else 'Poor Service'
		end as Type_of_Service
	from supplier as s
    join supplier_pricing using(supp_id)
    join orders using(pricing_id)
    join rating as r using(ord_id)
    group by s.supp_id, s.supp_name order by s.supp_id;
end //
DELIMITER ;

call SupplierRatings();