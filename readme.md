## Table of Contents
1. [Database](#database)
1. [Author(s)](#author)
1. [Database description](#description)
 
# Database
Japan Job Board
# Author(s)
Jonathan Vega
# Database description
I intend to look for employment in Japan after graduation, but with a lot of information scattered about, it is often difficult to know what to study, in terms of programming, and prepare for in obtaining a job. I wanted it to be very friendly for foreigners that have difficulty understanding Japanese to plan about getting a job.

The three strong entities are the Company, Person, and Job (each with their own primary key that's an ID). There will be two login pages, one for a company and the other for an individual user, and that user can be either a job seeker or admin. Job Seekers have a relationship called view and apply for a job, and admins and companies can post, delete, and edit a job. Each user (Person) consists of a unique id, first name, last name, visa sponsor, user name, password, and language proficiency. Each company has a unique company id, company name, company bio, user name, password, location, and maybe a profile-pic [might have to use relative position]. Initally I will log in as admin and add a few notable programming jobs in Japan and their requirements. Eventually a company will be interested in added their own job opportunities themseleves, and when a job has beed found, they can delete their post, or edit it to rework new changes.