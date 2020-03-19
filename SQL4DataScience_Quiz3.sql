--Q1. Use a subquery to find the anmes of all tracks for the album "Californication". What is the title of the 8th track?
  --SUBQUERY METHOD:
    SELECT name, title
    FROM tracks AS t
    WHERE albumid IN (SELECT albumid
    FROM albums AS a
    WHERE title = 'Californication');
  --JOIN METHOD:
    SELECT t.name, a.title
    FROM tracks AS t
    INNER JOIN albums AS a ON t.albumid = a.albumid
    WHERE a.title = 'Californication';
--A1. Porcelain

--Q2. Find the total number of onvoices for each customer along with the customer's full name, city, and email. 
--    What is the email of the 5th person?
  SELECT c.firstname, c.lastname, c.city, c.email, count(i.invoiceid) AS total
  FROM customers AS c
  INNER JOIN invoices AS i ON c.customerid = i.customerid
  WHERE c.firstname LIKE 'Frant%'
  GROUP BY c.customerid;
--A2. frantisekw@jetbrains.com

--Q3. Retrieve the track name, album, artistID, and trackID for all the albums. What is the song title of trackID = 12 from 
--    the "For Those About to Rock We Salute You" album?
  SELECT t.name, al.title, ar.artistid, t.trackid
  FROM tracks AS t
  INNER JOIN albums AS al ON al.albumid = t.albumid
  INNER JOIN artists AS ar ON ar.artistid = al.artistid
  WHERE t.trackid = 12 AND al.title = 'For Those About To Rock We Salute You';
--A3. Breaking The Rules

--Q4. Retrieve a list with the managers last name, and the last name of te employees who report to him or her.
--    Who are the reports for the manager named Mitchell?
  SELECT e2.lastname AS mgrlast, e2.firstname AS mgrfirst, e1.lastname AS emplast
  FROM employees AS e1
  INNER JOIN employees AS e2 ON e1.reportsto = e2.employeeid
  WHERE mgrlast = 'Mitchell';
--A4. King, Callahan

--Q5. Find the name and ID of the artists who don't have albums. Two records share a same last name. What is it?
  SELECT ar.name, ar.artistid, al.albumid
  FROM artists AS ar
  LEFT JOIN albums AS al ON ar.artistid = al.artistid
  WHERE albumid IS NULL;
--A5. Gilberto

--Q6. Use a UNION to create a list of all the employee's & customer's first and last names, descending in last name.
--    Determine what the last name of the 6th record is.
  SELECT lastname, firstname
  FROM employees
  UNION
  SELECT lastname, firstname
  FROM customers
  ORDER BY lastname desc;
--A6. Taylor

--Q7. See if there are any customers who have a different city listed in their billing vs customer city. 
SELECT COUNT(c.customerid) AS total
FROM customers AS c
INNER JOIN invoices as i ON c.customerid = i.customerid
WHERE c.city != i.billingcity;
--A7. There aren't





