# Exercise 0

## 1. Hospital task


You have this json data, convert it into three tables: Hospital, Department and Doctor. Fill these tables with data. Do this manually and not programmatically.

```json
{
  "hospital": "Sjukhusstock",
  "address": "Drottninggatan 3, Stockholm",
  "departments": [
    {
      "name": "Kardiologi",
      "doctors": [
        { "id": 1, "name": "Dr. Abra Abrahamson" },
        { "id": 2, "name": "Dr. Erika Eriksson" }
      ]
    },
    {
      "name": "Neurologi",
      "doctors": [{ "id": 3, "name": "Dr. Sven Svensson" }]
    }
  ]
}
```

### Solution


- identify entities
- identify relationships and cardinalities
- create conceptual ERD
- create tables

**Initial naive conceptual ERD**

<img src = "../assets/initial_conceptual_model_ex1.png" width=500>

**Initial tables**

Hospital

|hospital_id|name        |address         |
|-----------|------------|----------------|
|1          |sjukhusstock|drottninggatan3 |
|2          |löwenströmsk|löwetvägen1     | # lagt till själv

Department

|department_id|name        |
|-------------|------------|
|1            |Kardiologi  |
|2            |Neurologi   |
|3            |Paliativ avd| # lagt till själv

Doctor

|doctor_id    |name                  |
|-------------|----------------------|
|1            |Dr. Abra Abrahamsson  |
|2            |Dr. Erika Eriksson    |
|3            |Dr. Sven Svensson     |
|4            |Dr. Alex Alexandersson|

refined with bridge tables to reflect many-to-many relatonships

<img src = "../assets/conceptual_hospital_ex0_1.png" width=500>

HospitalDepartment

|hospital_departmen_id|hospital_id|department_id|
|---------------------|-----------|-------------|
|1                    |1          |1            |
|2                    |1          |2            |
|3                    |2          |2            | # gjort själv
|4                    |2          |3            | # gjort själv



HospitalDoctor # gjort själv

|hospital_doctor_id|hospital_id|doctor_id|
|------------------|-----------|---------|
|1                 |1          |1        |
|2                 |1          |2        |
|3                 |1          |3        | 
|4                 |2          |4        | # gjort själv
|5                 |1          |4        | # gjort själv


DepartmentDoctor # gjort själv

|department_doctor_id|department_id|doctor_id|
|--------------------|-------------|---------|
|1                   |1            |1        |
|2                   |1            |2        |
|3                   |2            |3        |
|4                   |2            |4        | # gjort själv
|5                   |3            |4        | # gjort själv


Test a join
Want information on Sjukhusstock and its departments
- hospital_department can join with department_id and can join with department_id on department table and hospital_id on hospital_table
- query name from hospital table and name from department table

TODO: left for reader create this SQL query = DONE!

---

## 2. Library Bookly
A library called Bookly keeps track of books and members who borrow them. Each book has a title, author, and ISBN number. Each member has a membership ID, name, and contact information. A member can borrow multiple books, but each book can be borrowed by only one member at a time.

a) Identify the entities and attributes for each entity.

b) Determine the relationship between member and books.

c) Draw a conceptual ERD using crow foots notation.

### Solution

a) Entities: 

- **Book**
  - ISBN # natural key
  - name
  - title
  - author

>[!NOTE]
> ISBN is a unique number for a book, which can be used as a ``primary key`` this will make it into a ``natural key``

- **Member**
  - membership_id # natural key
  - first_name
  - last_name
  - phone
  - address
  - email

**Borrowing**
  - borrowing_id
  - ISBN
  - membership_id
  - return_date
  - borrow_date

b)
- A member can have zero or several Borrowings
- A Borrowing can be made by one and only one Member
- A Borrowing is linked to one and only one Book
- A Book can be in zero or more Borrowings

c)

Initial conceptual ERD
<img src = "../assets/bookly.png" width=500>
<br>

Replaced many to many with a bridge table (composite entity)
<img src = "../assets/bookly1.png" width=500>


## 3. Car rental
Conceptual ERD to words.

This is an ERD conceptual diagram that a database designer and the business stakeholders agreed upon in a car rental company called Carent.
<img src = "../assets/ERD3.png" width=500>

a) Describe the entities in this conceptual ERD.

b) Write out the relationship labels.

c) Describe the relationships between the entities (one-to-many, one-to-one and many-to-many).

d) Define the relationship statement for example: "A Customer can have one or more Rentals".

### Solutions

a) 
- Customer, is a person that can make rentals for cars.
- Car, is the cars that can be rented by the customer. 
- Rental (composite entity), is the transaction between Car and Customer





Alternative to put in the descriptions into the entities directly in conceptual ERD:
<img src = "../assets/carrent.png" width=500>

b) see image above

c) 
  - Customer to rental (one-to-many)
  - Rental to Customer (many-to-one)
  - Rental to Car (many-to-one)
  - Car to Rental (one-to-many)

d)

- Customer makes one or more Rentals
- Each Rental is connected to one Customer
- Each Rental is for one Car
- Each Car can be in several Rentals

## 4. Online store
You are designing a database for an online store that sells multiple products. Customers can place multiple orders, and each order contains multiple products.

a) Identify entities and their relationships

b) Create a conceptual ERD with cardinalities

### Solution:

a) Entities:
  - Customer
  - Order
  - OrderLine -  (Composite entity)
  - Product

  Relationships:
  - Customer places one or many Orders
  - Orders belong to one Customer
  - Orders contain one or many Orderlines
  - Orderlines belong to one Order
  - Orderline belongs has one Product
  - Products can be in many Orderlines

b)
  <img src = "../assets/shop.png" width=500>


## 5. University management system
A university needs a system to manage students, courses, and professors.

each student can enroll in multiple courses.
each course is taught by one professor.
a teacher can teach multiple courses.
a) Identify entities and their relationships

b) Come up with possible attributes for the entities

c) Draw conceptual ERD with cardinalities

d) Define business rules (e.g. a student can enroll in max 4 courses)

### Solution

a) 
Entities:
  - Student
  - Enrollment
  - Course
  - Professor

Relationships:
  - Student has Enrollments
  - Each Enrollment is made up of one Student
  - Each Enrollment is in one Course
  - A Course can be in several Enrollments
  - Each Course has one Professor
  - A Professor can hold several courses


b)
Student attributes:
  - Student ID (Primary)
  - Name
  - Address
  - Contact info

Enrollment attributes:
  - Student_id (foreign key)
  - Course_id (foreign key)

Course attributes:
  - course_id (Primary)
  - name
  - start_date
  - end_date
  - professor_id (foreign key)

Professor attributes:
  - professor_id (primary)
  - name
  - email

  c)

  <img src = "../assets/university.png" width=500>

  d)


## 6. Onshop
An e-commerce platform Onshop manages customers, orders, and products.

a customer can place multiple orders.
each order contains multiple products.
a product can belong to multiple categories.
a) Identify key entities and their attributes (e.g., customer_name, order_date)

b) Sketch the conceptual ERD.

c) Define business rules

### Solution

a)
Entities:
  - Customer
  - OrderLine
  - Order
  - Product
  - ProductCategory
  - Category

Customer attributes:
  - customer_id (primary)
  - name
  - address
  - email
  - phone_number

OrderLine attributes:
  - orderline_id (primary)
  - order_id (foreign)
  - product_id (foreign key)
  - quantity
  - price (priset vid ordertillfället, eftersom pris kan ändras)

Order attributes:
  - order_id (primary)
  - customer_id (foreign)
  - order_date
  - total_sum  

Product attributes:
  - product_id (primary)
  - name
  - description
  - price
  - stock_quantity
  
ProductCategory attribues:
  - product_id (foreign)
  - category_id (foreign)

Category attributes:
  - category_id (primary)
  - name
  - description

b)

drew a logical model instead:
<img src = "../assets/onshop_logical.png" width=500>