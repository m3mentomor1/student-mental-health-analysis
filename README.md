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

## Findings

Average diagnostic scores for international students by length of stay:

| stay | count_int | average_phq | average_scs | average_as |
| ---: | --------: | ----------: | ----------: | ---------: |
| 10 | 1 | 13.00 | 32.00 | 50.00 |
| 8 | 1 | 10.00 | 44.00 | 65.00 |
| 7 | 1 | 4.00 | 48.00 | 45.00 |
| 6 | 3 | 6.00 | 38.00 | 58.67 |
| 5 | 1 | 0.00 | 34.00 | 91.00 |
| 4 | 14 | 8.57 | 33.93 | 87.71 |
| 3 | 46 | 9.09 | 37.13 | 78.00 |
| 2 | 39 | 8.28 | 37.08 | 77.67 |
| 1 | 95 | 7.48 | 38.11 | 72.80 |

- Most international students in the sample are recent arrivals: **95** have stayed 1 year, with far fewer at longer stays. Results for 5–10 years are based on only 1–3 students each and should be treated cautiously.
- Focusing on stays of 1–4 years (where the counts are more reliable), average depression (`average_phq`) and acculturative stress (`average_as`) generally **increase** with length of stay, while social connectedness (`average_scs`) stays relatively flat.
- Acculturative stress peaks at around year 4 (`87.71`), and average depression is highest at year 3 (`9.09`) among these better-sampled groups.
- Overall, length of stay appears linked to higher average depression and acculturative stress scores for international students, which aligns with the idea that time abroad can remain a mental health risk factor—not only the initial transition.

## Acknowledgements

This project is adapted from DataCamp's Associate Data Analyst in SQL track.

**Instructor:** Jasmin Ludolf  
Senior Data Science and AI Content Developer, DataCamp

Jasmin is a Senior Content Developer at DataCamp. After ten years as a global marketing manager in the music industry, she changed careers to follow her curiosity for data. Her passion is value exchange and making data science and AI accessible to all.
