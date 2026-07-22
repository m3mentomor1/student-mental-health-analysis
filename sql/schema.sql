-- Student Mental Health Analysis
-- PostgreSQL schema for the `students` survey dataset (Japanese international university, 2018).
-- Source: students.csv (268 student rows; trailing summary rows in the CSV are excluded).

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    -- Demographics / enrollment
    inter_dom        VARCHAR(10),   -- Type of student: Inter | Dom
    region           VARCHAR(20),   -- Geographic region of origin (e.g. SEA, EA, JAP, SA, Others)
    gender           VARCHAR(10),   -- Male | Female
    academic         VARCHAR(10),   -- Academic level: Under | Grad
    age              INTEGER,       -- Current age of student
    age_cate         INTEGER,       -- Age category (1–5)
    stay             INTEGER,       -- Length of stay in years
    stay_cate        VARCHAR(10),   -- Stay category: Short | Medium | Long

    -- Language proficiency
    japanese         INTEGER,       -- Japanese proficiency score (1–5)
    japanese_cate    VARCHAR(10),   -- Japanese proficiency: Low | Average | High
    english          INTEGER,       -- English proficiency score (1–5)
    english_cate     VARCHAR(10),   -- English proficiency: Low | Average | High

    -- Personal / risk flags
    intimate         VARCHAR(5),    -- In an intimate relationship: Yes | No
    religion         VARCHAR(5),    -- Has a religion: Yes | No
    suicide          VARCHAR(5),    -- Suicidal ideation: Yes | No
    dep              VARCHAR(5),    -- Experienced depression: Yes | No
    deptype          VARCHAR(10),   -- Depression type: No | Major | Other
    todep            INTEGER,       -- Total depression score (PHQ-9)
    depsev           VARCHAR(10),   -- Depression severity: Min | Mild | Mod | ModSev | Sev

    -- Social connectedness (SCS) and acculturative stress (ASISS) subscales
    tosc             INTEGER,       -- Total social connectedness score (SCS)
    apd              INTEGER,       -- Perceived discrimination
    ahome            INTEGER,       -- Homesickness
    aph              INTEGER,       -- Perceived hate
    afear            INTEGER,       -- Fear
    acs              INTEGER,       -- Culture shock
    aguilt           INTEGER,       -- Guilt
    amiscell         INTEGER,       -- Miscellaneous
    toas             INTEGER,       -- Total acculturative stress score (ASISS)

    -- Help-seeking / support network (Likert-style scores)
    partner          INTEGER,
    friends          INTEGER,
    parents          INTEGER,
    relative         INTEGER,
    profess          INTEGER,       -- Professional help
    phone            INTEGER,       -- Phone helpline
    doctor           INTEGER,
    reli             INTEGER,       -- Religion / faith-based support
    alone            INTEGER,
    others           INTEGER,
    internet         INTEGER,

    -- Binary indicators for support sources (Yes | No)
    partner_bi       VARCHAR(5),
    friends_bi       VARCHAR(5),
    parents_bi       VARCHAR(5),
    relative_bi      VARCHAR(5),
    professional_bi  VARCHAR(5),
    phone_bi         VARCHAR(5),
    doctor_bi        VARCHAR(5),
    religion_bi      VARCHAR(5),
    alone_bi         VARCHAR(5),
    others_bi        VARCHAR(5),
    internet_bi      VARCHAR(5)
);

