---------------------------------------
-- author: Gonzalo Salazar
-- course: SQL for Data Science (Coursera)
-- purpose: lecture notes
-- description: Codes + Notes
---------------------------------------

/*

Structured Query Language (SQL): standard computer language for relational
database management and data manipulation

Used to query, insert, update and modify data.
	(i) Read/retrieve, (ii) write (add data), (iii) update (insert new data)

-> Used to communicate with databases.
-> Statements are made up of descriptive words and are easy to learn.
-> A non-procedural language (simple, but powerful)

SQL: interpreter between me and the database. Our write syntax will vary,
depending on the Database Management System (DBMS).
  Some DBMS: Microsoft SQL Server, MySQL, IBM DB2 Oracle,
  Apache Open Office Base, Sybase ASE, SQLite, PostgreSQL.

Data Model Building Blocks
	Entity: person, place thing or event. Distinguishable, unique and distinct
	Attribute: a characteristic of an entity
	Relationship: describes association among entities.
		(i)   one-to-many
		(ii)  many-to-many
		(iii) one-to-one

ER diagrams
  Show relationships, business process, represented visually, show links
  (primary links)

Used to merge tables together:
  -> Primary links: A column (or set of columns) whose values uniquely
                    identify every row in a table.
  -> Foreign links: One or more columns that can be used together to identify
                    a single row in another table

*/

-- from now on, SQLite will be used --

---------------------------------------
-- SELECTING AND RETRIEVEN DATA WITH SQL
-- The following statements are equivalent (* grab each individual column
-- from database_name):
-- The query HAS to end with semi-conlon (;)

-- First way
SELECT column1_name, column2_name, column3_name
FROM database_name;

-- Second way
SELECT column1_name
      ,column2_name
		  ,column3_name
FROM database_name;

-- Third way
SELECT *
FROM database_name;

-- if we just want a sample, we can limit the number of records with LIMIT
SELECT *
FROM database_name
LIMIT 5;
-- WHERE ROWNUM <= 5; -- (in Oracle)
--FETCH FIRST 5 ROWS ONLY; -- (in DB2)

---------------------------------------
-- CREATING A TABLE
-- It requires column name, data type and specifications around the column
-- Primary keys cannot be null (MUST HAVE A VALUE!)

CREATE TABLE table_name
  (
    col_name1   char(10)      PRIMARY KEY,
    col_name2   char(10)      NOT NULL,   -- NOT allowing no values on it
    col_name3   char(250)     NOT NULL,
    col_name4   char(250)     NOT NULL,
    col_name5   decimal(8,2)  NOT NULL,
    col_name6   Varchar(750)  NULL        -- allowing no values on it
  );

---------------------------------------
-- ADDING DATA TO A TABLE

INSERT INTO table_name
VALUES ('val1'  -- '434343'
       ,'val2'  -- 'Gucci'
       ,'val3'  -- 'Slippers'
       ,'val4'  -- 'Green'
       ,'val5'  -- '390.00'
       ,'val6'  --  NULL
              );

-- However there is no warranty of which data goes to each column. Instead,
-- a more specific way works better.

INSERT INTO table_name
        (col_name1
        ,col_name2
        ,col_name3
        ,col_name4
        ,col_name5
        ,col_name6
        )
VALUES ('val1'  -- '434343'
       ,'val2'  -- 'Gucci'
       ,'val3'  -- 'Slippers'
       ,'val4'  -- 'Green'
       ,'val5'  -- '390.00'
       ,'val6'  --  NULL
              );

---------------------------------------
-- CREATING TEMPORARY TABLES
-- This are going to be deleted when current session is terminated
-- Faster than creating a real table
-- Allows to simplify complex queries

CREATE TEMPORARY TABLE name_table AS
  (
    SELECT *
    FROM table_name_from
    WHERE column_name = 'specific_value'
  )

---------------------------------------
-- UDPDATING TABLES

/* TO BE CHECKED */
-- https://sqlite.org/lang.html

---------------------------------------
-- DELETING TABLES

/* TO BE CHECKED */
-- https://sqlite.org/lang.html

---------------------------------------
-- FILTERING
-- Reduce the number of records we retrieve
-- Increase query performance
-- operators: =, <> or !=, >, <, >=, <=, BETWEEN, IS NULL

SELECT *
FROM table_name_from
WHERE column_name operator value;
-- WHERE column_name BETWEEN floor_num AND ceil_num;
-- WHERE column_name IS NULL;

---- Special operators
-- IN: specifies a range of conditions. CSV. Enclosed in ().
-- Faster than OR. Can contain another SELECT (sub-queries). Order does not matter.

SELECT *
FROM table_name_from
WHERE column_name IN (f1, f2, f3);
--WHERE column_name IN ('s1', 's2', 's3');

-- OR: use for any rows matching the specific conditions. Second condition is
--     not evaluated if the first condition is met.

SELECT *
FROM table_name_from
WHERE column_name = 'value1' OR column_name = 'value2';

-- AND: opposite of OR.
-- SQL pocessess AND before OR. Preferred to use ().

SELECT *
FROM table_name_from
WHERE (column_name = 'value1' OR column_name = 'value2')
  AND column_name2 > num_value;

-- NOT
SELECT *
FROM table_name_from
WHERE NOT column_name = 'value1'
  AND NOT column_name = 'value2';

---------------------------------------
-- WILDCARDS
-- Special characters used to match parts of a value.
-- Uses LIKE as an operatior (technically a predicate)
-- Can be used with strings (not for non-text datatypes)
-- Cons: take longer to run! Specially when used at the end of search patterns
-- Placement is important!

-- % WILDCARD
-- '%WORD' grabs anythin ending with the word WORD
-- 'WORD%' grabs anything after the word WORD
-- '%WORD%' grabs anything before and after the word WORD
-- 'S%E' grabs anything that starts with "S" and ends with "E"
-- 't%@gmail.com' grabs gmail addresses that start with "t"
-- % will not match NULL values

-- Underscore (_) WILDCARD (not supported by DB2)
-- Matches a single character

WHERE size LIKE '_word'
-- output: sword, mword, pword, etc.

-- Bracket [] WILDCARD (not supported by SQlite)
-- Used to specify a set of characters in a specific location

---------------------------------------
-- SORTING: ORDER BY command
-- Can sort by a column not retrieved
-- Must always be the last clause in a select statement
-- Direction can be added, but only applies to the preceding column name

SELECT *
FROM database
ORDER BY column_name2
      ,column_name3;

-- or
SELECT *
FROM database
ORDER BY 2, 3;

-- or
SELECT *
FROM database
ORDER BY 2 ASC, 3 DESC;

---------------------------------------
-- CALCULATIONS
-- PEMDAS: +, -, /, *

SELECT column_name
  ,column_name2
  ,column_name3
  ,(column_name4 * column_name5) / column_name6 AS new_column_name
FROM database;

---------------------------------------
-- AGGREGATE FUNCTIONS
-- Useful to add alias (AS...) otherwise the name will be a blank cell

-- AVERAGE
SELECT AVG(column_name) AS new_column_name
FROM database;

-- COUNT
-- Counts all the rows in a table containin values or NULL values
SELECT COUNT(*) AS new_column_name
FROM database;

-- Counts all the rows in a specific column ignoring NULL values
SELECT COUNT(column_name) AS new_column_name
FROM database;

-- MIN, MAX: NULL values will be ignored
SELECT MAX(column_name) AS new_column_name
  ,MIN(column_name2) AS new_column_name2
FROM database;

-- SUM
SELECT SUM(column_name*column_name1) AS new_column_name
FROM database
WHERE column_name4 = 40;

-- DISTINCT: useful to avoid duplicate data on our calculations
-- If not specified, SQL will assume we want all the data
SELECT COUNT(DISTINCT column_name) AS new_column_name
FROM database;

---------------------------------------
-- GROUPING DATA

-- GROUP BY: can contain multiple columns. Each column in the SELECT statement
-- must be present in a GROUP BY clause, except for aggregated calculations.
-- NULLs will be grouped together if the GROUP BY column contains NULLs
SELECT region
  ,COUNT(CustomerID) AS customerID
FROM database
GROUP BY region;

-- Notice that WHERE does not work for groups since it filters on rows. Instead
-- we should use the HAVING command. Remember that WHERE filters before the
-- data is grouped; and then, HAVING filters after the data is grouped.
SELECT customerID
  ,COUNT (*) AS orders
FROM Orders
WHERE UnitPrice >= 4
GROUP BY CustomerID
HAVING COUNT (*) >=2
ORDER BY CustomerID;  -- In case we want to sort the data

---------------------------------------
-- SUB-QUERIES: queries embedded into other queries
 /*

These merge data frrom multiple sources/tables together.
Help with adding other filtering criteria
Better to start from the innermost query

note:
  -> there is no limit to the number of subqueries
  -> at the cost of performance
  ->subquery selects can only retrieve a single column; reason why it is
    used in filtering a lot

IMPORTANT: Indentation is key!!

     */

-- EXAMPLE: need to know the regon each customer is from who has had an order
--          with freight over 100
SELECT CustomerID
  ,CompanyName
  ,Region
FROM Customers
WHERE customerID IN (
    SELECT customerID
    FROM orders
    WHERE Freight > 100 );

-- www.poorsql.com: helps to read un-indented SQL code.

-- EXAMPLE 2: need the total number of orders placed by every customer

SELECT customer_name
  ,customer_state
  (
    SELECT COUNT (*) AS orders
    FROM Orders
    WHERE Orders.customer_id = Customer.customer_id
  ) AS orders
FROM customers
ORDER BY Customer_name;

---------------------------------------
-- JOINS

/*

  Used because data is divided into tables for:
  -> greater scalabiliy
  -> easier data manipulation
  -> efficient storage
  -> logically model a process within a business

  JOINS! then associate correct records from each table in the fly
  -> allows data retrieval from multiple tables in one query
  -> BUT are not physical, only persist for the duration of the query execution

    */

-- CARTESIAN (CROSS) JOIN
-- Each row from the first table joins with all the rows of another table
-- Computationally taxing, not frequently used, not always return the correct
-- values.
SELECT product_name
  ,unit_price
  ,company_name
FROM Suppliers CROSS JOIN Products;
--   source 1              source 2

-- INNER JOIN
-- Selects record that have matching values (keys) in both tables
-- If a variable is in both tables, I have to pre-qualify it to tell SQL from
-- where it should be pulled from.
SELECT Suppliers.CompanyName
  ,product_name
  ,unit_price
FROM Suppliers INNER JOIN Products
  ON Suppliers.supplierid = Products.supplierid
