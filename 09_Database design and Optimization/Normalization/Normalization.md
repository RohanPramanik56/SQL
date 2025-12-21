# Normalization
Normalization is a database schema design technique that modifies an existing schema to minimize redundancy and dependency of data. It involves decomposing larger tables into smaller, more organized tables.

## Key Concepts
- **First Normal Form (1NF)**
- **Second Normal Form (2NF)**
- **Third Normal Form (3NF)**
- **Boyce-Codd Normal Form (BCNF)**

## First Normal Form (1NF)
**Definition:** A table is in First Normal Form (1NF) if each cell contains only a single value (atomic value) and each record needs to be unique.

### Example of a Table Not in 1NF
| EmployeeID | EmployeeName | Projects |
|------------|--------------|----------|
| 101        | John         | P1, P2   |
| 102        | Jane         | P2, P3   |

This table is not in 1NF because the 'Projects' column contains multiple values in a single cell.

### Transforming to 1NF
| EmployeeID | EmployeeName | ProjectNumber |
|------------|--------------|---------------|
| 101        | John         | P1            |
| 101        | John         | P2            |
| 102        | Jane         | P2            |
| 102        | Jane         | P3            |

Now, each cell contains a single value, and the table is in 1NF.

## Second Normal Form (2NF)
**Definition:** A table is in Second Normal Form (2NF) if it is in 1NF and all non-key attributes are fully functionally dependent on the primary key (eliminates partial dependency).
#### Example of a Table Not in 2NF
| EmployeeID | EmployeeName | ProjectNumber | ProjectName |
|------------|--------------|---------------|-------------|
| 101        | John         | P1            | Alpha       |
| 101        | John         | P2            | Beta        |
| 102        | Jane         | P2            | Beta        |
| 102        | Jane         | P3            | Gamma       |

This table is not in 2NF because 'ProjectName' is partially dependent on 'ProjectNumber' but not on the full primary key (EmployeeID, ProjectNumber).
### Transforming to 2NF
#### 1. Employee Table
| EmployeeID | EmployeeName |
|------------|--------------|
| 101        | John         |
| 102        | Jane         |

#### 2. Project Table
| ProjectNumber | ProjectName |
|---------------|-------------|
| P1            | Alpha       |
| P2            | Beta        |
| P3            | Gamma       |

#### 3. Assignment Table
| EmployeeID | ProjectNumber |
|------------|---------------|
| 101        | P1            |
| 101        | P2            |
| 102        | P2            |
| 102        | P3            |

Now, each non-key attribute is fully functionally dependent on the primary key, and the table is in 2NF.

## Third Normal Form (3NF)
**Definition:** A table is in Third Normal Form (3NF) if it is in 2NF and all the attributes are functionally dependent only on the primary key (eliminates transitive dependency).
#### Example of a Table Not in 3NF
| EmployeeID | EmployeeName | ProjectNumber | Rate | HourlyCharges |
|------------|--------------|---------------|------|---------------|
| 101        | John         | P1            | 50   | 500           |
| 101        | John         | P2            | 60   | 600           |
| 102        | Jane         | P2            | 60   | 600           |
| 102        | Jane         | P3            | 70   | 700           |

This table is not in 3NF because 'HourlyCharges' is transitively dependent on 'EmployeeID' through 'Rate'.

### Transforming to 3NF

#### 1. Employee Table
| EmployeeID | EmployeeName |
|------------|--------------|
| 101        | John         |
| 102        | Jane         |

#### 2. Project Table
| ProjectNumber | ProjectName |
|---------------|-------------|
| P1            | Alpha       |
| P2            | Beta        |
| P3            | Gamma       |

#### 3. Rate Table
| Rate | HourlyCharges |
|------|---------------|
| 50   | 500           |
| 60   | 600           |
| 70   | 700           |

#### 4. Assignment Table
| EmployeeID | ProjectNumber | Rate |
|------------|---------------|------|
| 101        | P1            | 50   |
| 101        | P2            | 60   |
| 102        | P2            | 60   |
| 102        | P3            | 70   |

Assuming 'EmployeeID' and 'ProjectNumber' form the primary key, 'ProjectLocation' should not depend on 'EmployeeID'.

## Transforming to BCNF

#### 1. Employee Table
| EmployeeID | EmployeeName |
|------------|--------------|
| 101        | John         |
| 102        | Jane         |

#### 2. Project Table
| ProjectNumber | ProjectName | ProjectLocation |
|---------------|-------------|-----------------|
| P1            | Alpha       | LocationA       |
| P2            | Beta        | LocationB       |
| P3            | Gamma       | LocationC       |

#### 3. Assignment Table
| EmployeeID | ProjectNumber |
|------------|---------------|
| 101        | P1            |
| 101        | P2            |
| 102        | P2            |
| 102        | P3            |

Now, the table is in BCNF because every determinant is a candidate key.