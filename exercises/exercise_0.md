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

<img src = "../assets/initial_conceptual_model_ex1.png" width=300>

**Initial tables**

Hospital

|hospital_id|name        |address         |
|-----------|------------|----------------|
|1          |sjukhusstock|drottninggatan3 |

department

|department_id|name        |
|-------------|------------|
|1            |Kardiologi  |
|2            |Neurologi   |

doctor

|doctor_id    |name                  |
|-------------|----------------------|
|1            |Dr. Abra Abrahamsson  |
|2            |Dr. Erika Eriksson    |
|3            |Dr. Sven Svensson     |

refined with bridge tables to reflect many-to-many relatonships

<img src = "../assets/conceptual_hospital_ex0_1.png" width=300>

HospitalDepartment
|hospital_departmen_id|hospital_id|department_id|
|---------------------|-----------|-------------|
|1                    |1          |1            |
|2                    |1          |2            |



HospitalDoctor

TODO: left for the reader

DepartmentDoctor

TODO: left for the reader


Test a join

Want information on Sjukhusstock and its departments
- hospital_department can join with department_id and can join with department_id on department table and hospital_id on hospital_table
- query name from hospital table and name from department table

TODO: left for reader create this SQL query