Exercises
Submit your answers to the following questions.

NOTE: Real-world examples must be your own and not based on the text or previous assignments.

> How do you find related data held in two separate data tables?

Related data from separate tables is found using join statements.  These select information that is founding by searching for common values that the two columns share.  For example, a customer's id number may be used to hold their personal information.  However, that can then also link to data like a coupon table and show the coupons that are also available to that customer.  These connections can be used to link together different sets of data.

> Explain, in your own words, the difference between an INNER JOIN, LEFT OUTER JOIN, and RIGHT OUTER JOIN. Give a real-world example for each.

  An INNER JOIN is searching for data that is shared by both tables.  For example if you have two data tables, one holding data about customers and another holding data about special offers and the customers who have used those offers, you could search for commonalities.  An INNER JOIN would return customers who have used those offers.

  With the outer joins, it will also return all of the information from the defined outer tables even if they do not share information with the other table.  For example, in a LEFT OUTER JOIN it would return all of the customers, whether or not they have used a special offer or not.  It would return null values under the special offers that were not used by the customers.  A RIGHT OUTER JOIN would be the opposite.  It would return all offers, but only the customers that have used the offers.  It would return null values under the customer section for unused offers.

> Define primary key and foreign key. Give a real-world example for each.

  Primary key is the identifier that is used for each row in the table.  Much like a hash id is used to identify a certain data set, the primary acts as an id in a row.  The foreign key is then used in other tables to link it to other data sets.  For example in the customer offers example, the primary key represents a customer.  It can then be used as a foreign key on the offer table.  The customer id might be on multiple offers depending upon which are used.  When doing a join statement you might find that the customer has used multiple special offers that are all connected under that customer id foreign key.

> Define aliasing.

Aliasing is a way of shortening variable names so that for longer statements and complex statements, it is a shorter syntax.  It uses single letters as replacements.

Change this query so that you are using aliasing:

```sql
SELECT professor.name, compensation.salary,
compensation.vacation_days FROM professor JOIN
compensation ON professor.id =
compensation.professor_id;
```

```sql
SELECT p.name, c.salary, c.vacation_days
  FROM professor AS p
  JOIN compensation AS c
  ON p.id = c.professor_id;
```

> Why would you use a NATURAL JOIN? Give a real-world example.

A NATURAL JOIN is one that finds only tables that have shared data.  For example, you may search for data that is found in multiple places.  For example, in a school database, they may compare student records from one year to the next.  They could look by name, location, or phone number to check for student records and see how they compare and see if they have changed.  It is a way of comparing data sets directly.


Using this Employee schema and data, write queries to find the following information:

List all employees and all shifts.

```sql
SELECT *
FROM shifts
INNER JOIN scheduled_shifts
ON shifts.id = scheduled_shifts.employee_id
INNER JOIN employees
ON employees.id = scheduled_shifts.employee_id
ORDER BY scheduled_shifts.shift_id;
```

**RESULTS**

id | date | start_time | end_time | employee_id | shift_id | id | name
---|------|------------|----------|-------------|----------|----|-----
5 | 1998-03-09 | 16:00:00 | 20:00:00 | 5 | 1 | 5 | Padma Patil
1 | 1998-03-09 | 08:00:00 | 12:00:00 | 1 | 2 | 1 | Hermione Granger
3 | 1998-03-09 | 12:00:00 | 16:00:00 | 3 | 3 | 3 | Luna Lovegood
5 | 1998-03-09 | 16:00:00 | 20:00:00 | 5 | 4 | 5 | Padma Patil
9 | 1998-03-10 | 12:00:00 | 20:00:00 | 9 | 5 | 9 | Dean Thomas
5 | 1998-03-09 | 16:00:00 | 20:00:00 | 5 | 6 | 5 | Padma Patil
1 | 1998-03-09 | 08:00:00 | 12:00:00 | 1 | 7 | 1 | Hermione Granger
2 | 1998-03-09 | 08:00:00 | 16:00:00 | 2 | 8 | 2 | Ronald Weasley
5 | 1998-03-09 | 16:00:00 | 20:00:00 | 5 | 9 | 5 | Padma Patil
9 | 1998-03-10 | 12:00:00 | 20:00:00 | 9 | 10 | 9 | Dean Thomas
5 | 1998-03-09 | 16:00:00 | 20:00:00 | 5 | 11 | 5 | Padma Patil
1 | 1998-03-09 | 08:00:00 | 12:00:00 | 1 | 12 | 1 | Hermione Granger
3 | 1998-03-09 | 12:00:00 | 16:00:00 | 3 | 13 | 3 | Luna Lovegood
5 | 1998-03-09 | 16:00:00 | 20:00:00 | 5 | 14 | 5 | Padma Patil
4 | 1998-03-09 | 12:00:00 | 20:00:00 | 4 | 15 | 4 | Draco Malfoy
1 | 1998-03-09 | 08:00:00 | 12:00:00 | 1 | 17 | 1 | Hermione Granger
2 | 1998-03-09 | 08:00:00 | 16:00:00 | 2 | 18 | 2 | Ronald Weasley
8 | 1998-03-10 | 12:00:00 | 16:00:00 | 8 | 19 | 8 | Cho Chang
4 | 1998-03-09 | 12:00:00 | 20:00:00 | 4 | 20 | 4 | Draco Malfoy
1 | 1998-03-09 | 08:00:00 | 12:00:00 | 1 | 22 | 1 | Hermione Granger
3 | 1998-03-09 | 12:00:00 | 16:00:00 | 3 | 23 | 3 | Luna Lovegood
8 | 1998-03-10 | 12:00:00 | 16:00:00 | 8 | 24 | 8 | Cho Chang
4 | 1998-03-09 | 12:00:00 | 20:00:00 | 4 | 25 | 4 | Draco Malfoy


Using this Adoption schema and data, please write queries to retrieve the following information and include the results:

> Create a list of all volunteers. If the volunteer is fostering a dog, include each dog as well.

```sql
SELECT volunteers.first_name, volunteers.last_name, dogs.id, dogs.name
FROM volunteers
LEFT OUTER JOIN dogs
ON volunteers.foster_dog_id = dogs.id
```

**RESULTS**

first_name | last_name | id | name
-----------|-----------|----|-----
Rubeus | Hagrid | 10002 | Munchkin
Marjorie | Dursley | 10006 | Marmaduke
Sirius | Black | null | null
Remus | Lupin | null | null
Albus | Dumbledore | null | null


> The cat's name, adopter's name, and adopted date for each cat adopted within the past month to be displayed as part of the "Happy Tail" social media promotion which posts recent successful adoptions.SL

```sql
SELECT cats.name, adopters.first_name, adopters.last_name
FROM cats
INNER JOIN cat_adoptions
ON cats.id = cat_adoptions.cat_id
INNER JOIN adopters
ON cat_adoptions.adopter_id = adopters.id
WHERE CAST(cat_adoptions.date AS DATE) >= CURRENT_DATE -30;
```

**RESULTS**

name | first_name | last_name
-----|------------|----------
Mushi | Arabella | Figg
Victoire | Argus | Filch


> Create a list of adopters who have not yet chosen a dog to adopt.

```sql
SELECT adopters.first_name, adopters.last_name
FROM adopters
LEFT OUTER JOIN dog_adoptions
ON adopters.id = dog_adoptions.adopter_id
WHERE dog_adoptions.adopter_id IS null;
```

**RESULTS**

first_name | last_name
-----------|----------
Hermione | Granger
Arabella | Figg


> Lists of all cats and all dogs who have not been adopted.

```sql
SELECT dogs.name
FROM dogs
LEFT OUTER JOIN dog_adoptions
ON dogs.id = dog_adoptions.dog_id
WHERE dog_adoptions.dog_id IS null
UNION
SELECT cats.name
FROM cats
LEFT OUTER JOIN cat_adoptions
ON cats.id = cat_adoptions.cat_id
WHERE cat_adoptions.cat_id IS null;
```

**RESULTS**

name
----
Boujee
Lassie
Marley
Marmaduke
Munchkin
Nala
Seashell


> The name of the person who adopted Rosco.

I know that the second join statement is not needed, but I included it to make any query to find an adopted dog owner name.

```sql
SELECT adopters.first_name, adopters.last_name
FROM adopters
INNER JOIN dog_adoptions
ON adopters.id = dog_adoptions.adopter_id
INNER JOIN dogs
ON dogs.id = dog_adoptions.dog_id;
```

**RESULTS**

first_name | last_name
-----------|----------
Argus | Filch


Using this Library schema and data, write queries applying the following scenarios and include the results:

> To determine if the library should buy more copies of a given book, please provide the names and position, in order, of all of the patrons with a hold (request for a book with all copies checked out) on "Advanced Potion-Making".

```sql
SELECT patrons.name, holds.rank
FROM patrons
INNER JOIN holds
ON patrons.id = holds.patron_id
INNER JOIN books
ON holds.isbn = books.isbn
WHERE books.title = 'Advanced Potion-Making'
ORDER BY holds.rank;
```

name | rank
-----|-----
Terry Boot | 1
Cedric Diggory | 2


> List all of the library patrons. If they have one or more books checked out, list the books with the patrons.

```sql
SELECT *
FROM patrons
INNER JOIN transactions
ON patrons.id =  transactions.patron_id
WHERE transactions.checked_in_date IS null
GROUP BY patrons.id, transactions.id;
```

**Results**

id | name | id | patron_id | isbn | checked_out_date | checked_in_date
---|------|----|-----------|------|------------------|----------------
2 | Terry Boot | 5 | 2 | 9136884926 | 2018-07-15T00:00:00.000Z | null
5 | Cedric Diggory | 7 | 5 | 3458400871 | 2018-07-17T00:00:00.000Z | null

