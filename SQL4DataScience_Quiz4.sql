--Q1. Pull a list of customer ids with the customer's full name, address, and combo of city/country.
--    Be sure to add a space in between city and country and make it all caps.
--    What is the city and country result for CustomerID 16?

  SELECT CustomerID, FirstName || ' ' || Lastname AS FirstLast, Address, City, Country, UPPER(City)||' '||UPPER(Country) AS CityCountry
  FROM Customers
  WHERE CustomerID = 16;

--A1. MOUNTAIN VIEW USA

--Q2. Create a new employee userid by combining the first 4 letters of the employee's first name with the
--    first 2 letters of the employee's last name. Make the new field lower case.
--    What is the final result for Robert King?

  SELECT firstname, lastname, lower(substr(firstname,1,4)) || lower(substr(lastname,1,2)) AS empID
  FROM employees
  WHERE firstname = 'Robert' AND lastname = 'King';

--A2. robeki

--Q3. Show a list of employees who have worked for the company for 15 years. Sort by lastname ascending.
--    What is the lastname of the last person on the list returned?

  SELECT EmployeeID, Firstname, LastName, HireDate, DATE('now') - HireDate AS YearsOfService
  FROM Employees
  WHERE YearsOfService >= 15
  ORDER BY LastName ASC;

--A3. Jane Peacock

--Q4. Are there any columns with null values in the Customers table? 

  SELECT *
  FROM Customers
  WHERE FirstName IS NULL;
  
--A4. FirstName was the last column that was inserted into the query. Unfortunately, there does not see to be a simple
--    way to query all columns at the same time, but the final answer is: Company, Fax, PostalCode, and Phone.

--Q5. Find the cities wht the most customers and rand in descending order. Which of the following cities have 2 customers?

  SELECT City, COUNT(CustomerID) AS CustomerCount 
  FROM Customers
  GROUP BY City
  HAVING CustomerCount = 2
  ORDER BY CustomerCount DESC;

--A5. Sao Paulo, Mountain View, and London.

--Q6. Combine the customer's invoice ID with their first and last name. Order by firstname, lastname, and invoiceID.

  SELECT i.invoiceid, c.firstname, c.lastname, c.firstname || c.lastname || i.invoiceid AS NewID
  FROM Invoices i
  INNER JOIN customers c ON c.customerid = i.customerid
  WHERE newid LIKE '%AstridGruber%'
  ORDER BY firstname, lastname, invoiceid;
  
--A6. AstridGruber (273,296,354,370,408,456)
