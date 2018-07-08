# Exercises

1.  What data types do each of these values represent?

| Data                 | Data Type |
| -------------------- | --------- |
| "A Clockwork Orange" | String    |
| 42                   | Number    |
| 09/02/1945           | String    |
| 98.7                 | Number    |
| $15.99               | String    |

2.  Explain when a database would be used. Explain when a text file would be used.

Databases are used for information that is large and dynamic. A text file would be used for a simple piece of data that does not often update and change. For example if you have store that only sells one kind of product you could keep that information about inventory in a simple text file.

However, most stores sell many products and their inventory is always changing. Therefore a database is more useful. It can hold the information about different products and keep track of a complex inventory as it changes and is updated. It is easy to add in new products, or delete products when they are no longer available. Essentially a database allows for large and complex information to be stored easily.

3.  Describe one difference between SQL and other programming languages.

The main difference between SQL is that it is a declarative language. Rather than being concerned with how it works, you are simply concerned with the information that it is being gathered. Rather than trying to build the most efficient way of finding information, the database engine determines how to do that and gets the data that we are looking for from the table.

4.  In your own words, explain how the pieces of a database system fit together at a high level.

A database system is used to store information that a program or app would use. The data can than be accessed when needed from the database and used when necessary. For example on a shopping site each of the users will be stored in the database. Along with each user the database can store personal information, purchase history, and other information is associated with each user. Then when the user logs in they can get all of their information that is stored in the database. When they make a purchase or change information the database is then updated and changed. This information can be accessed from multiple devices. The database stores the individual's information that is accessed by the front end and shown to the user.

5.  Explain the meaning of table, row, column, and value.

| Term   | Meaning                                                                                                                            |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| Table  | The whole data set that is laid out in a grid system. Similar to a spread sheet.                                                   |
| Row    | The information in the data set laid out horizontally. Usually it represents one instance of what the data set is holding.         |
| Column | The vertical categories for the information that is being held. This structures and defines the data that is held in the database. |
| Value  | The number, string, or object that is held for each box in the database.                                                           |

6.  List three data types that can be used in a table.

Strings, Numbers, and Objects can all be used in a database.

7.  Given this payments table, provide an English description of the following queries and include their results:

```sql
    --#1
    SELECT date, amount
    FROM payments;

    --#2
    SELECT amount
    FROM payments
    WHERE amount > 500;

    --#3
    SELECT \*
    FROM payments
    WHERE payee = 'Mega Foods';
```

    #1. This selects the date and amount columns from the payments table.
    #2. This selects all amounts that are greater than 500 in te payments table
    #3. This selects all columns for the rows where the payee is 'Mega Foods' from the payments table.

8.  Given this users table, write SQL queries using the following criteria and include the output:

The email and sign-up date for the user named DeAndre Data.

```sql
select email, signup from user
  where name = 'DeAndre Data'
```

The user ID for the user with email 'aleesia.algorithm@uw.edu'.

```sql
select userid from user
 where email = 'aleesia.algorithm@uw.edu'
```

All the columns for the user ID equal to 4.

```sql
select * from user
  where userid = 4
```
