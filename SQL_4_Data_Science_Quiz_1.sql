--Q1. Retrieve all the records from the Employees table. What is Robert King's mailing address? 
--Note: You will have to scroll to the right in order to see it.

      select FirstName
            ,LastName
            ,Address
      from employees
      where FirstName = 'Robert' and LastName = 'King';
      
-----

--Q2. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.
--Which of the employees listed below has a birthdate of 3-3-1965?

      select FirstName
              ,LastName
              ,Birthdate
              ,Address
              ,City
              ,State
      from Employees
      where Birthdate like '1965%';
      
----

--Q3. Retrieve all the columns from the Tracks table, but only return 20 rows.What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn"? Note: You will need to scroll to the right to see it, and you may want to copy and paste the number to ensure it is entered correctly.What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn"? 
--Note: You will need to scroll to the right to see it, 
--and you may want to copy and paste the number to ensure it is entered correctly.

      select TrackId, Track, Milliseconds
      from Tracks
      where TrackId = 5;
