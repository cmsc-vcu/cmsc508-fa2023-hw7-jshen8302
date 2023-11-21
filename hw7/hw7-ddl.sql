# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
        skills_id int,
        skills_name varchar(255) NOT NULL,
        skills_description varchar(255) NOT NULL,
        skills_tag varchar(255) NOT NULL,
        skills_url varchar(255),
        skills_time_commitment int,
        PRIMARY KEY (skills_id)

);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(skills_id, skills_name, skills_description, skills_tag) values
( 1, 'kick boxing', 'visualize this!','Skill 1' ),
( 2, 'cooking', 'yum yum soup', 'Skill 2'),
( 3, 'surfing', 'rides the big kahuna', 'Skill 3'),
( 4, 'bobarista', 'makes taro milk tea and lychee punch', 'Skill 4'),
( 5, 'discord mod', 'manages over 8 different servers', 'Skill 5'),
( 6, 'snow remover', 'can remove any amount of snow', 'Skill 6'),
( 7, 'kickflip', 'on a skateboard', 'Skill 7'),
( 8, 'ice_cream_remover', 'can remove any amount of ice cream', 'Skill 8');


select * from skills;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL auto_increment,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    email varchar(255),
    linkedin_url varchar(255),
    headshort_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined date,
    PRIMARY KEY (people_id)
);
# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_last_name,date_joined) values 
(1,'Person 1','2004-04-04'),
(2, 'Person 2','2014-02-24'),
(3, 'Person 3', '2015-12-23'),
(4, 'Person 4', '2016-01-28'),
(5, 'Person 5', '2016-01-30'),
(6, 'Person 6', '2020-06-08');

select * from people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    peopleskills_id int NOT NULL auto_increment,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id)
);

select * from peopleskills;
# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills(skills_id, people_id, date_acquired) values 
(1, 1, '2023-04-12'), (3, 1, '2023-01-01'), (6, 1, '2023-02-15'),
(3, 2, '2023-03-23'), (4, 2, '2023-04-10'), (5, 2, '2023-05-05'),
(1, 3, '2023-06-20'), (5, 3, '2023-07-07'),
(3, 5, '2023-08-12'), (6, 5, '2023-09-18'),
(2, 6, '2023-10-30'), (3, 6, '2023-11-15'), (4, 6, '2023-12-25'),
(3, 7, '2024-01-10'), (5, 7, '2024-02-22'), (6, 7, '2024-03-08'),
(1, 8, '2024-04-14'), (3, 8, '2024-05-27'), (5, 8, '2024-06-11'), (6, 8, '2024-07-19'),
(2, 9, '2024-08-04'), (5, 9, '2024-09-09'), (6, 9, '2024-10-25'),
(1, 10, '2024-11-12'), (4, 10, '2024-12-30'), (5, 10, '2025-01-03');

select * from peopleskills


 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int auto_increment,
    roles_name varchar(255),
    sort_priority int,
    PRIMARY KEY (roles_id)
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(roles_name,sort_priority) values 
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40), 
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    peopleroles_id int NOT NULL auto_increment,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date,
    PRIMARY KEY (peopleroles_id)
)



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles( people_id, role_id, date_assigned) values 
(1,2,'2026-01-05' ),
(2, 5, '2026-02-13'), (2, 6, '2026-03-19'),
(3,2,'2026-04-28'),(3,4,'2026-05-10'),
(4,3,'2026-06-25'),
(5,3,'2026-07-09'),
(6,2,'2026-07-09'),(6,1,'2026-08-14'),
(7,1,'2026-09-23'),
(8,1,'2026-10-30'),(8,4,'2026-11-15'),
(9,2,'2026-12-20'),
(10,2,'2027-01-02'),(10,1,'2027-02-20');

select * from peopleroles