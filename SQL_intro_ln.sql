---------------------------------------
-- author: Gonzalo Salazar
-- course: SQL for Data Science (Coursera)
-- purpose: lecture notes
-- description: N/A
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
LIMIT 5;  -- WHERE ROWNUM <= 5; (in Oracle) and FETCH FIRST 5 ROWS ONLY; (in DB2)
