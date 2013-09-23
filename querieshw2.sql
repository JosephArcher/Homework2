-- Joseph Archer
-- Queries Homework # 2

-- 1. Get the cities of agents booking an order for customer c002

SELECT distinct
city
FROM 
agents
WHERE aid IN (
SELECT 
aid
FROM
orders
WHERE 
cid = 'c002'
)

-- 2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto

SELECT distinct pid
FROM orders
WHERE aid IN (



SELECT distinct aid
FROM orders
WHERE cid = (

SELECT cid
FROM customers
where city = 'Kyoto' 

)

)

-- 3. Find the cids and names of customers who never placed an order through agent a03


SELECT distinct cid , name
FROM customers
WHERE cid NOT IN (


SELECT distinct cid
FROM orders
WHERE aid = 'a03'

)

--4. Find the cids and names of customers who ordered both product p01 and p07

SELECT distinct cid , name
FROM customers
WHERE cid IN (

SELECT distinct cid
FROM orders
WHERE pid = 'p07'  AND cid IN (

SELECT distinct cid
FROM orders
WHERE pid = 'p01' 

)
)

-- 5. Get the pids of products ordered by any customers who ever placed an order through agent a03


SELECT distinct pid
FROM orders
WHERE cid IN (


SELECT distinct cid
FROM orders
WHERE aid = 'a03'




)
-- 6. Get the names and discounts of all customers who place orders through agents in Dallas or Duluth

SELECT distinct name , discount
FROM customers
WHERE cid IN  (

SELECT cid
FROM orders
WHERE aid IN (

SELECT aid
FROM agents
WHERE city = 'Duluth' OR city = 'Dallas'
)
)

-- 7. Find all customers who have the same discount as that of any customers in Dallas or Kyoto

SELECT *
FROM customers
WHERE discount IN 
(
SELECT discount
FROM customers
WHERE city = 'Dallas' OR city = 'Kyoto'
)
AND city NOT IN (
SELECT city
FROM customers
WHERE city = 'Dallas' OR city = 'Kyoto'
)