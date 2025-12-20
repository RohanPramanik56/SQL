# Dependencies and Anomalies
Dependencies refer to the relationship between different attributes (columns) within a table. These dependencies can lead to various issues or anomalies.

## 1. Functional Dependency
Functional dependency occurs when the value of one attribute uniquely determines the value of another attribute within the same table.

#### Example:
Assume we have a table named students with the following columns:
| Student ID | Student Name |
|------------|--------------|
| 101        | Rahul        |
| 102        | Priya        |
Here, Student Name is functionally dependent on Student ID because knowing the Student ID allows us to determine the Student Name.

#### Definition:
Functional dependency is a concept used to describe the relationship between attributes within a table. A functional dependency exists when the value of one attribute uniquely determines the value of another attribute.

## 2. Partial Dependency
Partial dependency occurs when an attribute is functionally dependent on only a part of a composite primary key, rather than the entire key.

#### Example:
Consider a table named employee_projects:
| Employee ID | Project ID | Employee Name | Project Name |
|-------------|------------|---------------|--------------|
| 101         | 4004       | Ayush         | Java         |
| 102         | 4004       | Shiva         | Java         |
| 101         | 4005       | Ayush         | Python       |
Here, Employee Name is dependent on Employee ID, and Project Name is dependent on Project ID. However, Employee ID and Project ID together form a composite primary key. This creates a partial dependency where an attribute is dependent on only a part of the composite key.

#### Definition:
Partial dependency is a concept that occurs when an attribute or column in a table is functionally dependent on only a part of the composite primary key rather than the entire key.

### 3. Transitive Dependency
Transitive dependency occurs when an indirect relationship causes functional dependency. If attribute A determines attribute B, and attribute B determines attribute C, then attribute A indirectly determines attribute C.

#### Example:
Consider a table named student_courses:
| Student ID | Course ID | Marks | Result |
|------------|-----------|-------|--------|
| 101        | 1         | 100   | Pass   |
| 102        | 2         | 80    | Pass   |
| 103        | 3         | 35    | Fail   |

Here, Marks is dependent on Student ID, and Result is dependent on Marks. Therefore, Result is transitively dependent on Student ID.

#### Definition:
When an indirect relationship causes functional dependency, it is known as transitive dependency. If A determines B, and B determines C, then A determines C.

## Anomalies in DBMS
Anomalies refer to the potential issues that can arise in a database due to dependencies. There are three main types of anomalies: insertion anomaly, update anomaly, and deletion anomaly.

### 1. Insertion Anomaly
Insertion anomaly occurs when inserting data into the database leads to redundant data or incomplete information.

#### Example of Redundant Data:
Consider a table named student_courses:
| Student ID | Student Name | Course ID | Course Name |
|------------|--------------|-----------|-------------|
| 101        | Rahul        | 1         | Java        |
| 102        | Raj          | 1         | Java        |
| 103        | Priya        | 1         | Java        |
| 104        | Ankit        | 2         | SQL         |
| 105        | Ayesha       | 3         | Python      |
If multiple students are taking the same course, the course information is repeated, leading to redundant data.

#### Example of Incomplete Information:
Consider a table named employee_projects:

| Employee ID | Project ID | Employee Name | Project Name |
|-------------|------------|---------------|--------------|
| 101         | 4004       | Puneet        | Java         |

If we want to add a new employee without knowing the project details, it becomes impossible due to the not-null constraint on the composite key.

### 2. Update Anomaly
Update anomaly occurs when updating data in the database affects multiple rows or columns unintentionally.

#### Example:
Consider a table named employee_projects:

| Employee ID | Project ID | Employee Name | Project Name |
|-------------|------------|---------------|--------------|
| 101         | 4004       | Ayush         | Project A   |
| 102         | 4004       | Shiva         | Project A   |
| 101         | 4005       | Ayush         | Project B   |

If we want to update Project A to New Project A, we have to update multiple rows, which can be time-consuming and prone to errors.

### 3. Deletion Anomaly
Deletion anomaly occurs when deleting data from the database results in the loss of information that might be important or leads to inconsistency in the remaining data.

#### Example:
Consider a table named student_courses:

| Student ID | Student Name | Course ID | Course Name |
|------------|--------------|-----------|-------------|
| 101        | Rahul        | 1         | Java        |
| 101        | Rahul        | 2         | SQL         |
| 102        | Raj          | 1         | Java        |
| 103        | Priya        | 3         | Python      |

If we delete the student with Student ID 101, we lose information about the courses they were enrolled in, leading to loss of important data.