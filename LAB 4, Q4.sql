/*Question 4 : Display the total number of customers based on gender who have 
placed individual orders of worth at least Rs.3000*/

/*this question is really confusing. it is not able to  properly convey 
what is to be retrieved. 
1st MEANING:total value of all orders for the 
customers should be atleast 3000   
OR 
2nd MEANING:customers having an individual
order worth atleast 3000? Since the answer will change according to the scenario, 
I have written the queries for both scenarios.
PLEASE CONSIDER THIS AND GRADE ME ACCORDINGLY*/

/*2nd MEANING: customers having an individual order worth atleast 3000*/
select cus_gender as Gender, count(cus_id) as Total_Customers from customer 
join orders using(cus_id) 
join supplier_pricing using(pricing_id) where SUPP_PRICE>=3000
group by cus_gender;

/*1st MEANING: total value of all orders for the customers should be 
atleast 3000*/
SELECT cus_gender AS gender, COUNT(DISTINCT cus_id) AS total_customers
FROM orders
JOIN customer USING (cus_id)
JOIN supplier_pricing USING (pricing_id)
GROUP BY cus_gender
HAVING SUM(supp_price) >= 3000;
