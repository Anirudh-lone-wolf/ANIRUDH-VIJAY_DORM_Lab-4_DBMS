/*Question 7 :Find the least expensive product from each category and print 
the table with category id, name, product name and price of the product*/

select c.cat_id as category_id, c.cat_name as category, p.pro_name as product,
sp.supp_price as price from category c
join product p using(cat_id)
join supplier_pricing sp using(pro_id)
join (
    select c.cat_id, min(sp.supp_price) as min_price
    from category c join product p using(cat_id)
	join supplier_pricing sp using(pro_id)
    group by c.cat_id
  ) subq on c.cat_id = subq.cat_id and sp.supp_price = subq.min_price
order by
  c.cat_id;
