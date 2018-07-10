-- select email, signup from user
--   where name = 'DeAndre Data'

-- select userid from user
--  where email = 'aleesia.algoritm@uw.edu'

-- select * from user
--   where userid = 4

-- Exercises

-- List the commands for adding, updating, and deleting data.

-- Explain the structure for each type of command.

-- What are some of the data types that can be used in tables? Give a real-world example of each type.

-- Decide how to create a new table to hold a list of people invited to a wedding dinner. The table needs to have first and last names, whether they sent in their RSVP, the number of guests they are bringing, and the number of meals (1 for adults and 1/2 for children).


-- Which data type would you use to store each of the following pieces of information?
-- First and last name.
-- Whether they sent in their RSVP.
-- Number of guests.
-- Number of meals.
-- Write a command that creates the table to track the wedding dinner.

CREATE TABLE wedding (
    id integer,
    firstName text,
    lastName text,
    rsvp boolean,
    guests integer,
    meals numeric(3, 1),
);

-- Write a command that adds a column to track whether the guest sent a thank you card.

ALTER TABLE wedding ADD COLUMN thankyou boolean;

-- You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.

ALTER TABLE wedding DROP COLUMN meals;

-- The guests will need a place to sit at the reception, so write a command that adds a column for table number.

ALTER TABLE wedding ADD COLUMN tableNumber integer;

-- The wedding is over and we do not need to keep this information, so write a command that deletes the table numbers from the database.

DROP TABLE wedding

-- Write a command to create a new table to hold the books in a library with the columns ISBN, title, author, genre, publishing date, number of copies, and available copies.

CREATE TABLE library (
  isbn10 integer,
  title text,
  author text,
  genre text,
  publishingDate date,
  copies integer,
  availableCopies integer
)

-- Find three books and add their information to the table.

INSERT INTO library (isbn, title, author, genre, publishingdate, copies, availablecopies)
  VALUES
(0984782869, 'Cracking The Coding Interview', 'Gayle Laakmann McDowell', 'Programming', 'July 1, 2015', 4, 3)
(0262033844, 'Introduction to Algorithms, 3rd Edition', 'Thomas H. Cormen', 'Programming', 'July 31, 2009', 3, 1)
(1593275846, 'Eloquent JavaScript, 2nd Ed', 'Marijn Haverbeke', 'Programming', 'December 7, 2014', 5, 3)

-- Someone has just checked out one of the books. Change the number of available copies to 1 fewer.

UPDATE library SET availablecopies=2 WHERE isbn=1593275846

-- Now one of the books has been added to the banned books list. Remove it from the table.

DELETE FROM library WHERE isbn=0262033848

-- Write a command to make a new table to hold spacecrafts. Information should include id, name, year launched, country of origin, a brief description of the mission, orbiting body, if it is currently operating, and its approximate miles from Earth. In addition to the table creation, provide commands that perform the following operations:

CREATE TABLE satellites (
  id integer,
  name text,
  yearLaunched date
  country text,
  missionDescription text,
  orbitingBody text,
  operational boolean,
  milesFromEarth integer
)

-- Add three non-Earth-orbiting satellites to the table.

INSERT INTO satellites (id, name, yearLaunched, country, missionDescription, orbitingBody, operational, milesFromEarth)
  VALUES
    (1001, 'ARTEMIS', '2007', 'United States', 'Acceleration, Reconnection, Turbulence and Electrodynamics of the Moon’s Interaction with the Sun', 'The Moon', true, 238000)
    (1002, '2001 Mars Odyssey', '2001', 'United States', 'Use spectrometers and a thermal imager to detect evidence of past or present water and ice', 'Mars', true, 33900000)
    (1003, 'Akatsuki', '2010', 'Japan', 'Studying the stratification of the atmosphere, atmospheric dynamics, and cloud physics', 'Venus', true, 162000000)

-- Remove one of the satellites from the table since it has just crashed into the planet.

DELETE FROM satellites WHERE id=1001

-- Edit another satellite because it is no longer operating and change the value to reflect that.

UPDATE library SET operational=false WHERE id=1002

-- Write a command to create a new table to hold the emails in your inbox. This table should include an id, the subject line, the sender, any additional recipients, the body of the email, the timestamp, whether or not you have read the email, and the id of the email chain it's in. Also provide commands that perform the following operations:

CREATE TABLE inbox (
  id integer,
  subject text,
  sender text,
  additionalRecipients text[],
  body text,
  received date,
  read boolean,
  chainId integer
)

-- Add three new emails to the inbox.

INSERT INTO inbox (id, subject, sender, additionalRecipients, body, received, read, chainId)
  VALUES
  (000001, 'Welcome', 'bill@email.com', {mary@email.com, mike@email.com, jim@email.com}, 'Welcome to our new group chat.  We hope you get a lot out of it.', 'Jan-08-2009', true, 009 )
  (000002, 'Thanks for having me', 'mary@email.com', {bill@email.com, mike@email.com, jim@email.com}, 'Thanks for having me.  I really look forward to it.', 'Jan-09-2009', true, 009 )
  (000003, 'Big Help', 'mike@email.com', {mary@email.com, bill@email.com, jim@email.com}, 'This will really help to streamline efficiency here at the office', 'Jan-10-2009', true, 009 )

-- You deleted one of the emails, so write a command to remove the row from the inbox table.

DELETE FROM inbox WHERE id=000003

-- You started reading an email but just heard a crash in another room. Mark the email as unread before investigating the crash, so you can come back and read it later.

UPDATE inbox SET read=false WHERE id=000002
