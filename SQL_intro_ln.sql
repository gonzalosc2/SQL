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
WHERE column_name = 'value1' OR 'value2';

-- AND: opposite of OR.
-- SQL pocessess AND before OR. Preferred to use ().

SELECT *
FROM table_name_from
WHERE (column_name = 'value1' OR 'value2')
  AND column_name2 > num_value;

-- NOT
SELECT *
FROM table_name_from
WHERE NOT column_name = 'value1'
  AND NOT column_name = 'value2';





















---------------------------------------
-- SORTING


---------------------------------------
-- CALCULATING
