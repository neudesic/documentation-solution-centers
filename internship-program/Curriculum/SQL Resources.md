# SQL and SQL Server Introduction

1. [Relational Databases](#relationalDatabase)
   - [Example](#example2)
   - [Resources](#resource2)
2. [What is SQL?](#SQL)
   - [Example](#example1)
   - [Resources](#resource1)
3. [Entity Framework](#entityFramework)
   - [Example](#example3)
   - [Resources](#resource3)
4. [LINQ Queries](#linqQueries)
   - [Example](#example4)
   - [Resources](#resource4)

## **Relational Databases** <a name="relationalDatabase"></a>

A relational database is a type of database that stores and provides access to data points that are related to one another. Each row in the database table contains a unique ID called the key. The columns of the table hold attributes of the data, and each record has a value for each attribute, making it easy to establish the relationships between data points.

### **Example** <a name="example2"></a>


[Relational Database Table](https://phoenixnap.com/kb/wp-content/uploads/2021/06/relational-database-table-elements.png)

### **Resources** <a name="resource2"></a>

- [Oracle](https://www.oracle.com/database/what-is-a-relational-database/)

- [Pluralsight](https://app.pluralsight.com/library/courses/relational-database-design/table-of-contents)
## **What is SQL?** <a name="SQL"></a>

Structured Query Language (SQL) is a standardized programming language that is used to manage relational databases and perform operations on the data contained in the databases. SQL is used for cleaning databases, modifying database tables, adding, updating, and deleting rows of data, and retrieving subsets of information from relational database management systems.

### **Example** <a name="example1"></a>

You have data about countries around the world that contains the population that you might not need for your analysis. By using SQL, you can drop the column from the database table:

ALTER TABLE Countries

DROP COLUMN Population;

### **Resources** <a name="resource1"></a>

- [Pluralsight](https://app.pluralsight.com/library/courses/introduction-to-sql/table-of-contents)

- [SQL Course](https://www.sqlcourse.com/beginner-course/what-is-sql/)


## **What is Entity Framework?** <a name="entityFramework"></a>

Entity framework is an open-source framework for .NET applications supported by Microsoft. It allows developers to work with data using objects of domain specific classes without focusing on the underlying database table where the data is being stored. This framework enables developers to create and maintain data-oriented applications at a higher level of abstraction when they deal with data.

### **What is Object-Relational Mapping?**

Object-relational mapping (ORM) is a programming technique in which a metadata is used to connect object code to a relational database. Object code is written in object oriented programming (OOP). ORM allows developers to convert data between type systems that are unable to coexist within relational databases and OOP languages (Java or C#).

### **Why Use ORM?**

ORM has multiple benefits including:
- Simplifying development due to the automation of object to table and table to object conversations, resulting in lower development and maintenance costs.
- Less code compared to embedded SQL and handwritten stored procedures.
- Transparent object caching in the application tier, improving system performance.

### **Example** <a name="example3"></a>

[Entity Framework Structure](https://www.entityframeworktutorial.net/images/basics/ef-in-app-architecture.png)

### **Resources** <a name="resource3"></a>

[Entity Framework Tutorial](https://www.entityframeworktutorial.net/what-is-entityframework.aspx)

[Pluralsight](https://app.pluralsight.com/course-player?clipId=2f21b185-b395-4144-a534-37adc0810915)

[Microsoft Docs](https://docs.microsoft.com/en-us/ef/)

[Object Relational Mapping](https://education.launchcode.org/csharp-web-development/chapters/orm-intro/background.html#:~:text=Object%2DRelational%20Mapping%20or%20ORM,a%20row%20of%20the%20table.)

## **LINQ Queries** <a name="linqQueries"></a>

A query is an expression that retrieves data from a data source. LINQ Queries offer a consistent model for working with data across various kinds of data sources and formats. The query starts with a "from" clause to specify which object it is obtaining the data from and ends with a "select" or "group" clause to specify what data is being assigned to a variable.

### **Example** <a name="example4"></a>

[LINQ Query](https://www.tutorialsteacher.com/Content/images/linq/linq-query-syntax.png)

In this example, the query is:

1. Getting the data from the object 'strList'

2. Finding the data points where the value contains "Tutorials"

3. Selecting that data to assign to the variable "result."

### **Resources** <a name="resource4"></a>

[LINQ Query Syntax](https://www.tutorialsteacher.com/linq/linq-query-syntax)

[Microsoft Docs](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/introduction-to-linq-queries)

[Pluralsight](https://app.pluralsight.com/library/courses/linq-fundamentals-csharp-6/table-of-contents)