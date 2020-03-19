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

--Q2. Find the total number of onvoices for each customer along with the customer's full name, city, and email. What is the email of the 5th person?
  SELECT c.firstname, c.lastname, c.city, c.email, count(i.invoiceid) AS total
  FROM customers AS c
  INNER JOIN invoices AS i ON c.customerid = i.customerid
  WHERE c.firstname LIKE 'Frant%'
  GROUP BY c.customerid;
--A2. frantisekw@jetbrains.com

--Q3. 
