--Q1. How many albums does the artist Led Zeppelin have?
  SELECT a.name, count(al.title) as albums
  FROM artists AS a
  JOIN albums AS al ON
    a.artistid = al.artistid
  WHERE a.name = 'Led Zeppelin'
  GROUP BY a.name;
--A1. 14

--Q2. Create a list of album titles and the unit prices for the artist "Audioslave". How many records are returned?
  SELECT al.title, ar.name, sum(t.unitprice) AS cost
  FROM tracks AS t
  INNER JOIN albums AS al ON al.albumID = t.albumID
  INNER JOIN artists AS ar ON ar.artistID = al.artistID
  WHERE ar.name like 'Audio%'
  GROUP BY al.title;
--A2. 3

--Q3. Find the first and last name of any customer who doesn't have an invoice. Are there any customers returned from the query?
  SELECT c.firstname, c.lastname, i.invoiceid
  FROM customers as c
  LEFT JOIN invoices as i ON c.customerID = i.customerID
  WHERE i.invoiceID IS NULL;
--A3. No

--Q4. Find the total price for each album. What is the price for the album "Big Ones"?
  SELECT ar.name, al.Title, sum(t.unitprice) AS cost
  FROM albums AS al
  INNER JOIN tracks AS t ON al.albumid = t.albumid
  INNER JOIN artists AS ar ON ar.artistid = al.artistid
  WHERE al.title = 'Big Ones'
  GROUP BY al.albumid;
--A4. $14.85

--Q5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?
  SELECT COUNT(*) AS total
  FROM invoices AS i
  CROSS JOIN invoice_items;
--A5. 922880
