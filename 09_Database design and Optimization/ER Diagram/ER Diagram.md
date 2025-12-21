# ER Diagram

## Understanding Dependencies in DBMS
When managing data in a table, dependencies between columns can lead to issues or anomalies. It's essential to grasp these concepts to ensure efficient database design and management.

### Types of Dependencies

#### 1. Functional Dependency:
- **Definition:** A functional dependency describes a relationship where one attribute uniquely determines another attribute.
- **Example:**
    - **Table:** Students
    - **Columns:** Student ID, Student Name
    - **Functional Dependency:** Student Name is functionally dependent on Student ID.

#### 2. Partial Dependency:
- **Definition:** Partial dependency occurs when an attribute is dependent on only a part of a composite primary key.
- **Example:**
    - **Table:** Employee_Projects
    - **Columns:** Employee ID, Project ID, Employee Name, Project Name
    - **Partial Dependency:** Employee Name depends on Employee ID, and Project Name depends on Project ID.
#### 3. Transitive Dependency:
- **Definition:** Transitive dependency occurs when an indirect relationship causes functional dependency.
- **Example:**
    - **Table:** Student_Courses
    - **Columns:** Student ID, Course ID, Marks, Result
    - **Transitive Dependency:** Result depends on Marks, and Marks depend on Student ID. Therefore, Result is transitively dependent on Student ID.

## Issues Due to Dependencies (Anomalies)
### 1. Insertion Anomaly
- **Redundant Data Insertion:**
  - **Example:**
        - **Table:** Student_Courses
        - **Columns:** Student ID, Student Name, Course ID, Course Name
    - **Issue:** If multiple students take the same course, course information is repeated, leading to redundant data.
- **Incomplete Information Insertion:**
    - **Example:**
        - **Table:** Employee_Projects
        - **Columns:** Employee ID, Project ID, Employee Name, Project Name
        - **Issue:** If an employee is added without an assigned project, it results in incomplete information because Project ID is part of the composite key and cannot be null.
### 2. Update Anomaly
- **Issue:** Updating data in a database affects multiple rows unintentionally.
    - **Example:**
        - **Table:** Employee_Projects
        - **Columns:** Employee ID, Project ID, Employee Name, Project Name
        - **Issue:** Changing the project name for a project requires updating multiple rows, leading to potential errors and time-consuming updates.
### 3. Deletion Anomaly
- **Issue:** Deleting data results in the loss of important information or inconsistency in remaining data.
    - **Example:**
        - **Table:** Student_Courses
        - **Columns:** Student ID, Student Name, Course ID, Course Name
        - **Issue:** Deleting a student also removes course information associated with that student, leading to loss of important course data.

# Introduction to ER Diagrams
To manage these issues effectively, we use ER diagrams to model the data before creating tables. An ER diagram visually represents entities (tables), their attributes (columns), and relationships between them.

### What is an ER Diagram?
An Entity-Relationship (ER) diagram is a visual representation of the entities in a database and the relationships between them. It helps in designing a database at the conceptual level by illustrating how different entities interact with each other.

## Components of an ER Diagram
- **1. Entities:** Represented by rectangles. Entities are objects or concepts that can have data stored about them.

- **2. Attributes:** Represented by ovals, connected to their respective entity. Attributes are properties or characteristics of an entity.

- **3. Relationships:** Represented by diamonds, connecting related entities. Relationships show how entities interact with each other.
  
## Types Of Entities:

### Strong Entity
A **strong entity** is an entity that can be uniquely identified by its own primary key. It does not depend on any other entity for its existence. These entities have attributes that uniquely define each instance of that entity within the database.
- **Key Characteristics:**
    - Has its own independent existence.
    - Can be identified by its primary key.
    - Not reliant on any other entity.
- **Example:**
In a database for an online course platform, the Course entity is a strong entity because it has a unique identifier (like CourseID) and does not rely on any other entity for its definition.

### Weak Entity
A weak entity is an entity that cannot be uniquely identified by its own attributes alone and is dependent on a "strong" or "parent" entity. It has a partial key (or discriminator) and a foreign key that references the strong entity. To uniquely identify instances of a weak entity, it combines its partial key with the primary key of the strong entity it depends on.
- **Key Characteristics:**
    - Dependent on a strong entity for its identification.
    - Has no primary key of its own but instead has a "partial key" and a foreign key referencing the strong entity.
    - Usually represented in ER diagrams with a double rectangle.
- **Example:**
OrderItem in an e-commerce database is a weak entity if it depends on an Order entity. An OrderItem might be identified by a combination of OrderID (a foreign key from Order) and ItemNumber (a partial key unique within the order).

## Types Of Attributes 

### 1. Simple Attribute
- **Definition:** An attribute that cannot be further divided into sub-attributes.
- **Example:** Name, Age, Gender are simple attributes since they represent a single piece of information.
- **Representation:** Represented as a single oval connected to its entity.

### 2. Composite Attribute
- **Definition:** An attribute that can be divided into smaller sub-attributes, each representing more detailed information.
- **Example:** Address could be a composite attribute that is further divided into Street, City, State, and Zip Code.
- **Representation:** Represented by an oval with its sub-attributes connected to it by lines.

### 3. Single-Valued Attribute
- **Definition:** An attribute that holds a single value for each instance of an entity.
- **Example:** StudentID or SSN are single-valued attributes because a person has only one of each.
- **Representation:** Simply represented by an oval connected to its entity.

### 4. Multi-Valued Attribute
- **Definition:** An attribute that can hold multiple values for a single instance of an entity.
- **Example:** Phone Numbers or Email Addresses are multi-valued attributes because a person can have more than one.
- **Representation:** Represented as a double oval connected to the entity.

### 5. Derived Attribute
- **Definition:** An attribute whose value is derived from other attributes within the database or can be calculated.
- **Example:** Age can be derived from Date of Birth, or Total Price can be derived from Quantity and Unit Price.
- **Representation:** Represented as a dashed oval connected to the entity.

### 6. Key Attribute
- **Definition:** An attribute that uniquely identifies an entity in a database. It is also known as the primary key.
- **Example:** EmployeeID, StudentID, or SSN can be key attributes as they uniquely identify each instance of an entity.
- **Representation:** Represented as an oval with its name underlined.

### 7. Optional (or Null) Attribute
- **Definition:** An attribute that may or may not have a value for a particular entity.
- **Example:** Middle Name could be optional since not all individuals have a middle name.
- **Representation:** There is no distinct notation in standard ER diagrams for optional attributes, but they are simply understood to be nullable.

## Summary Table
| Cardinality Ratio      | Description                                                                 | Example              | ER Representation            |
|------------------------|-----------------------------------------------------------------------------|----------------------|------------------------------|
| One-to-One (1:1)       | One instance of an entity is related to exactly one instance of another entity. | Person – Passport    | Line with "1" on both sides  |
| One-to-Many (1:M)      | One instance of an entity is related to multiple instances of another entity.  | Department – Employee| Line with "1" and "N"        |
| Many-to-Many (M:M)     | Multiple instances of one entity are related to multiple instances of another entity. | Student – Course     | Line with "M" and "N"        |

## Cardinality Ratio and Its Associated Definitions
Cardinality in the context of an Entity-Relationship (ER) diagram defines the numerical relationship between entities in a relationship. It describes how many instances of one entity relate to instances of another entity. Understanding the cardinality ratio is crucial for accurately modeling relationships between entities in a database.\
The three most common types of cardinality ratios are **One-to-One (1:1), One-to-Many (1:M), and Many-to-Many (M:M).**

## Types of Cardinality Ratios

### 1. One-to-One (1:1)
- **Definition:** A one-to-one relationship means that one instance of an entity is related to exactly one instance of another entity and vice versa.
- **Example:** A Person entity and a Passport entity share a 1:1 relationship because each person has exactly one passport, and each passport is assigned to exactly one person.
- **ER Representation:** Typically represented by a line between two entities with a "1" on both sides.\
**Use Case:** Such relationships are used when two entities are tightly connected, and each record in one entity corresponds to a single record in the other.

### 2. One-to-Many (1:M)
- **Definition:** A one-to-many relationship exists when one instance of an entity can be associated with multiple instances of another entity, but each instance of the second entity is associated with only one instance of the first entity.
- **Example:** A Department entity and an **Employee** entity have a 1 relationship because one department can have many employees, but each employee belongs to exactly one department.
- **ER Representation:** Represented by a line with a "1" on one side and "N" on the other (or sometimes "M" to denote "many").\
**Use Case:** This is the most common type of relationship found in databases, where a parent-child hierarchy is modeled (e.g., one Author has many Books).

### 3. Many-to-Many (M:M)
- **Definition:** A many-to-many relationship exists when multiple instances of one entity are related to multiple instances of another entity.
- **Example:** A **Student** entity and a **Course** entity have an M relationship because a student can enroll in multiple courses, and each course can have multiple students.
- **ER Representation:** Represented by a line with "M" on one side and "N" on the other side.\
**Use Case:** This relationship is often broken down into two one-to-many relationships by introducing a junction table or associative entity (e.g., Enrollment table that links StudentID and CourseID).

## Summary Table
| Cardinality Ratio  | Description                                                                 | Example               | ER Representation            |
|-------------------|-----------------------------------------------------------------------------|-----------------------|------------------------------|
| One-to-One (1:1)  | One instance of an entity is related to exactly one instance of another entity. | Person – Passport     | Line with "1" on both sides  |
| One-to-Many (1:M) | One instance of an entity is related to multiple instances of another entity.  | Department – Employee | Line with "1" and "N"        |
| Many-to-Many (M:M)| Multiple instances of one entity are related to multiple instances of another entity. | Student – Course      | Line with "M" and "N"        |

# Example: Hospital Management System ER Diagram
## Scenario
A hospital has multiple doctors, each identified by a unique ID, name, and specialization. Patients admitted to the hospital are registered with a patient ID, name, age, gender, admission date, and discharge date. Patients are assigned to specific doctors, and various tests are conducted for them. Each test has a unique test ID, name, date conducted, and result. Tests are associated with the corresponding patient and doctor.

### dentifying Entities and Attributes
#### 1. Entities:
- **Hospital:** Hospital ID, Hospital Name
- **Doctor:** Doctor ID, Doctor Name, Specialization
- **Patient:** Patient ID, Patient Name, Age, Gender, Admission Date, Discharge Date
- **Test:** Test ID, Test Name, Date Conducted, Result
#### 2. Relationships:
- **Hospital-Doctor:** One hospital can have multiple doctors (1:N).
- **Hospital-Patient:** One hospital can have multiple patients (1:N).
- **Doctor-Patient:** One doctor can have multiple patients, and each patient is assigned to one doctor (N:1).
- **Patient-Test:** One patient can have multiple tests (1:N).
- **Doctor-Test:** One doctor can conduct multiple tests (1:N).
  
### Creating the ER Diagram
- **Entities:** Represent each entity (Hospital, Doctor, Patient, Test) with a rectangle.
- **Attributes:** Connect ovals to each entity for its attributes.
- **Relationships:** Use diamonds to represent relationships between entities and connect them with lines.
  
```
[Hospital]
  |
  | (1:N)
  |
[Doctor]-----(N:1)---->[Patient]-----(1:N)---->[Test]
  |                       |
  | (1:N)                 |
  ----------------------->|
        (1:N)
```
Once the ER diagram is complete, we can create tables based on the diagram. Each entity becomes a table, each attribute becomes a column, and relationships are maintained using foreign keys.

### Example Tables
- **Hospital Table:**
    - **Columns:** Hospital ID (Primary Key), Hospital Name
- **Doctor Table:**
    - **Columns:** Doctor ID (Primary Key), Doctor Name, Specialization, Hospital ID (Foreign Key)
- **Patient Table:**
    - **Columns:** Patient ID (Primary Key), Patient Name, Age, Gender, Admission Date, Discharge Date, Hospital ID (Foreign Key), Doctor ID (Foreign Key)
  
- **Test Table:**
    - **Columns:** Test ID (Primary Key), Test Name, Date Conducted, Result, Patient ID (Foreign Key), Doctor ID (Foreign Key)