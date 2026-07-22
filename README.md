<div align="center">
  <h1>Student Mental Health Analysis</h1>
</div>

This is a mini data analysis project focused on analyzing student mental health data from a 2018 survey at a Japanese international university. The original study found that international students face a higher risk of mental health difficulties than the general population, and that social connectedness and acculturative stress are predictive of depression.

Using PostgreSQL, this project explores whether those patterns hold in the `students` dataset and whether **length of stay** is a contributing factor for international students.

It is based on a guided project from [DataCamp](https://www.datacamp.com)'s **Associate Data Analyst in SQL** track.

## Project instructions

Explore and analyze the `students` data to see how the length of stay (`stay`) impacts the average mental health diagnostic scores of the international students present in the study.

- Return a table with nine rows and five columns.
- The five columns should be aliased as: `stay`, `count_int`, `average_phq`, `average_scs`, and `average_as`, in that order.
- The average columns should contain the average of the `todep` (PHQ-9 test), `tosc` (SCS test), and `toas` (ASISS test) columns for each length of stay, rounded to two decimal places.
- The `count_int` column should be the number of international students for each length of stay.
- Sort the results by the length of stay in descending order.

## Key measures

| Field | Description |
| ----- | ----------- |
| `inter_dom` | Student type (`Inter` or `Dom`) |
| `stay` | Length of stay in years |
| `todep` | Depression score (PHQ-9) |
| `tosc` | Social connectedness score (SCS) |
| `toas` | Acculturative stress score (ASISS) |

## Project structure

```
student-mental-health-analysis/
├── notebook/
│   └── notebook.ipynb   # SQL exploration and analysis
├── sql/
│   ├── schema.sql       # PostgreSQL table definition
│   └── students.csv     # Survey responses
└── README.md
```

## Getting started

1. Create the database table from the schema:

```bash
psql -d your_database -f sql/schema.sql
```

2. Load the survey data (skip the header row; exclude trailing summary rows in the CSV if present):

```bash
psql -d your_database -c "\copy students FROM 'sql/students.csv' WITH (FORMAT csv, HEADER true)"
```

3. Open `notebook/notebook.ipynb` and run the SQL cells against your PostgreSQL connection.

## Example analysis

Average mental health scores for international students by length of stay:

```sql
SELECT stay,
       COUNT(*) AS count_int,
       ROUND(AVG(todep), 2) AS average_phq,
       ROUND(AVG(tosc), 2) AS average_scs,
       ROUND(AVG(toas), 2) AS average_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;
```

## Acknowledgements

This project is adapted from DataCamp's Associate Data Analyst in SQL track.

**Instructor:** Jasmin Ludolf  
Senior Data Science and AI Content Developer, DataCamp
