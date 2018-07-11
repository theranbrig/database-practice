# Exercises

> Use the commands above to complete the following tasks, and submit the SQL statements. Real-world examples must be distinct from those used in the text.

> List the commands for adding, updating, and deleting data.

    -   Adding
        -   INSERT INTO (new value)
        -   CREATE TABLE (new table)
    -   Updating
        -   UPDATE (new value),
        -   ALTER/ADD or DROP (change table)
    -   Deleting
        -   DELETE FROM (delete value)
        -   DROP TABLE (delete table)

> Explain the structure for each type of command.

NEW DATA

-   CREATE TABLE 'name of new table' (
    'columns' 'data types'
    )

-   INSERT INTO 'table where you want data' (list of columns in table)
    VALUES
    (Data for rows following order of list of columns in table)

UPDATING DATA

-   UPDATE 'table where you want update' SET 'column'='new value' WHERE 'parameter for deletion - usually an id number of some kind'

-   ALTER TABLE 'table name to change' ADD/DROP COLUMN 'column name' 'data type if adding column'

DELETING DATA

-   DELETE FROM 'table where you want to delete from' WHERE 'parameter for deletion - usually an id number of some kind'

-   DROP TABLE 'table name to be deleted'

> What are some of the data types that can be used in tables? Give a real-world example of each type.

    * Integers are whole numbers. Used to represent number of students in a classroom.
    * Text is to represent strings. This could represent a student's name or email address.
    * Booleans are true or false values. This could represent if they are enrolled in the school or not.
    * Dates represent time periods in a variety of ways. They could be used to show when the student enrolled or as an interval for the amount of time spent at the school.
    * Arrays can be built to hold lists of data. This could hold the courses that the student are enrolled in.

> Decide how to create a new table to hold a list of people invited to a wedding dinner. The table needs to have first and last names, whether they sent in their RSVP, the number of guests they are bringing, and the number of meals (1 for adults and 1/2 for children).

Which data type would you use to store each of the following pieces of information?

    -   First and last name. - **text**
    -   Whether they sent in their RSVP. - **boolean**
    -   Number of guests. - **integer**
    -   Number of meals. - **numeric**

Write a command that creates the table to track the wedding dinner.

```sql
CREATE TABLE wedding (
    id integer,
    firstName text,
    lastName text,
    rsvp boolean,
    guests integer,
    meals numeric(3, 1),
);
```

Write a command that adds a column to track whether the guest sent a thank you card.

```sql
ALTER TABLE wedding ADD COLUMN thankyou boolean;
```

You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.

```sql
ALTER TABLE wedding DROP COLUMN meals;
```

The guests will need a place to sit at the reception, so write a command that adds a column for table number.

```sql
ALTER TABLE wedding ADD COLUMN tableNumber integer;
```

The wedding is over and we do not need to keep this information, so write a command that deletes the table numbers from the database.

```sql
DROP TABLE wedding
```

> Write a command to create a new table to hold the books in a library with the columns ISBN, title, author, genre, publishing date, number of copies, and available copies.

```sql
CREATE TABLE library (
  isbn10 integer,
  title text,
  author text,
  genre text,
  publishDate date,
  copies integer,
  availableCopies integer
)
```

Find three books and add their information to the table.

```sql
INSERT INTO library (isbn10, title, author, genre, publishDate, copies, availableCopies)
  VALUES
(0984782869, 'Cracking The Coding Interview', 'Gayle Laakmann McDowell', 'Programming', 'July 1, 2015', 4, 3)
(0262033844, 'Introduction to Algorithms, 3rd Edition', 'Thomas H. Cormen', 'Programming', 'July 31, 2009', 3, 1)
(1593275846, 'Eloquent JavaScript, 2nd Ed', 'Marijn Haverbeke', 'Programming', 'December 7, 2014', 5, 3)
```

Someone has just checked out one of the books. Change the number of available copies to 1 fewer.

```sql
UPDATE library SET availableCopies=2 WHERE isbn=1593275846
```

Now one of the books has been added to the banned books list. Remove it from the table.

```sql
DELETE FROM library WHERE isbn=0262033848
```

> Write a command to make a new table to hold spacecrafts. Information should include id, name, year launched, country of origin, a brief description of the mission, orbiting body, if it is currently operating, and its approximate miles from Earth. In addition to the table creation, provide commands that perform the following operations:

```sql
CREATE TABLE satellites (
  id integer,
  satelliteName text,
  yearLaunched date,
  country text,
  missionDescription text,
  orbitingBody text,
  operational boolean,
  milesFromEarth integer
)
```

Add three non-Earth-orbiting satellites to the table.

```sql
INSERT INTO satellites (id, satelliteName, yearLaunched, country, missionDescription, orbitingBody, operational, milesFromEarth)
  VALUES
    (1001, 'ARTEMIS', '2007', 'United States', 'Acceleration, Reconnection, Turbulence and Electrodynamics of the Moon’s Interaction with the Sun', 'The Moon', 'true', 238000),
    (1002, '2001 Mars Odyssey', '2001', 'United States', 'Use spectrometers and a thermal imager to detect evidence of past or present water and ice', 'Mars', 'true', 33900000),
    (1003, 'Akatsuki', '2010', 'Japan', 'Studying the stratification of the atmosphere, atmospheric dynamics, and cloud physics', 'Venus', 'true', 162000000);
```

Remove one of the satellites from the table since it has just crashed into the planet.

```sql
DELETE FROM satellites WHERE id=1001
```

=Edit another satellite because it is no longer operating and change the value to reflect that.

```sql
UPDATE library SET operational='false' WHERE id=1002
```

> Write a command to create a new table to hold the emails in your inbox. This table should include an id, the subject line, the sender, any additional recipients, the body of the email, the timestamp, whether or not you have read the email, and the id of the email chain it's in. Also provide commands that perform the following operations:

```sql
CREATE TABLE inbox (
  id integer,
  subject text,
  sender text,
  additionalRecipients text ARRAY,
  body text,
  received date,
  read boolean,
  chainId integer
)
```

Add three new emails to the inbox.

```sql
INSERT INTO inbox (id, subject, sender, additionalRecipients, body, received, read, chainId)
  VALUES
  (000001, 'Welcome', 'bill@email.com', '{"mary@email.com", "mike@email.com", "jim@email.com"}', 'Welcome to our new group chat.  We hope you get a lot out of it.', 'Jan-08-2009', 'true', 009 ),
  (000002, 'Thanks for having me', 'mary@email.com', '{"bill@email.com", "mike@email.com", "jim@email.com"}', 'Thanks for having me.  I really look forward to it.', 'Jan-09-2009', 'true', 009 ),
  (000003, 'Big Help', 'mike@email.com', '{"mary@email.com", "bill@email.com", "jim@email.com"}', 'This will really help to streamline efficiency here at the office', 'Jan-10-2009', 'true', 009 );
```

You deleted one of the emails, so write a command to remove the row from the inbox table.

```sql
DELETE FROM inbox WHERE id=000003
```

You started reading an email but just heard a crash in another room. Mark the email as unread before investigating the crash, so you can come back and read it later.

```sql
UPDATE inbox SET read='false' WHERE id=000002
```
