# Exercises

Answer the following questions and submit the responses.

> Write out a generic SELECT statement.

`SELECT <ColumnName1, ColumnName1, Etc.> FROM <TABLE NAME> WHERE <ColumnName or Parameter> <LIKE/OPERATOR> <Condition>`

> Create a fun way to remember the order of operations in a SELECT statement, such as a mnemonic.

Small Frogs Will Leap or Crawl (**S**ELECT **F**ROM **W**HERE **L**IKE **or** **C**ONDITIONAL)

> Given this dogs table, write queries to select the following pieces of data:

Intake teams typically guess the breed of shelter dogs, so the breed column may have multiple words (for example, "Labrador Collie mix").
Display the name, gender, and age of all dogs that are part Labrador.

```sql
SELECT name, gender, age FROM dogs WHERE breed LIKE '%labrador%';
```

Display the ids of all dogs that are under 1 year old.

```sql
SELECT name, age FROM dogs WHERE age < 1;
```

Display the name and age of all dogs that are female and over 35lbs.

```sql
SELECT name, age FROM dogs WHERE gender='F' AND weight > 35;
```

Display all of the information about all dogs that are not Shepherd mixes.

```sql
SELECT * FROM dogs WHERE breed NOT LIKE '%shepherd%';
```

Display the id, age, weight, and breed of all dogs that are either over 60lbs or Great Danes.

```sql
SELECT id, age, weight, breed FROM dogs WHERE weight > 60 OR breed='great dane';
```

> Given this cats table, what records are returned from these queries?

`SELECT name, adoption_date FROM cats;`

| name     | adoption_date            |
| -------- | ------------------------ |
| Mushi    | 2016-03-22T00:00:00.000Z |
| Seashell | null                     |
| Azul     | 2016-04-17T00:00:00.000Z |
| Victoire | 2016-09-01T00:00:00.000Z |
| Nala     | null                     |

`SELECT name, age FROM cats;`

| name     | age |
| -------- | --- |
| Mushi    | 1   |
| Seashell | 7   |
| Azul     | 3   |
| Victoire | 7   |
| Nala     | 1   |

From the cats table, write queries to select the following pieces of data.

Display all the information about all of the available cats.

```sql
SELECT * FROM cats;
```

Choose one cat of each age to show to potential adopters.

```sql
SELECT name, age FROM cats;
```

Find all of the names of the cats, so you don’t choose duplicate names for new cats.

```sql
SELECT names FROM cats;
```

> List each comparison operator and explain when you would use it. Include a real world example for each.
> If you can’t list these from memory, do these flashcards until you can!

-   `=` The equal to operator checks that the a statement exists for strings or numbers. You can use this to search for a name in a school database.
-   `<, <=` These are the less than and less than or equal to operators. They check that left side is lower (or equal to) compared to right side. In the school database you may check to see the students who have been there less than two years.
-   `>, >=` These are the more than and more than or equal to operators. They check that the left side is more (or equal to) when compared to right side. In the school database example this could be used to check for students who live more than a certain distance from the school.
-   `!=, <>` These work by checking for items that are not equal to. This means that they will return values that do not match the criteria. For example you could search for the first names of students, but not include those who are in a certain grade level.
-   `LIKE, %` These are used to help match strings. If searching for a student you could include LIKE Dylan% which would search for the phrase at the beginning, LIKE %Dylan which would search for it at the end, or LIKE %Dylan$ which would search for it anywhere within the phrase.
-   `AND` This is used to connect together one or more search criteria. This means that both (or more) phrases must be met. You could search for a name and check gender at the same time.
-   `OR` This is used to connect together one or more search criteria as well. However, in this case one or the other must be true in order to get a result. In the school example you could look for students who are first year or last year students.
-   `NOT` This is used much like the != or <> in that it is looking to exclude results. You may exclude certain rows based on certain cases. For example you could do a search of students birthdays and not include those who were born in the summer.

> From the cats table, what data is returned from these queries?

`SELECT name FROM cats WHERE gender = ‘F’;`

**name**
Seashell
Nala

`SELECT name FROM cats WHERE age <> 3;`

**name**
Mushi
Seashell
Victoire
Nala

`SELECT ID FROM cats WHERE name != ‘Mushi’ AND gender = ‘M’;`

**id**
3
4

## Resubmission

Choose one cat of each age to show to potential adopters.

```sql
SELECT DISTINCT age FROM cats;
```

Find all of the names of the cats, so you don’t choose duplicate names for new cats.

```sql
SELECT DISTINCT name FROM cats;
```
