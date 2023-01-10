## Querying the Materialize DB
To query the materialize database go to the materialize UI (https://cloud.materialize.com/) where you will find a connection string/command for your user under the section labeled 'Connect'. In a terminal that has pSQL installed enter the command. SHould look something like this. 

```psql "postgres://{user_email}@aisk7vdkbxzboe1imqxvttwtf.us-east-1.aws.materialize.cloud:6875/materialize"```

You will be prompted to enter a password. Find that password from Clayton or create a new password in the Materialize UI and enter it here.

You should now be in a Materialize session in your terminal. Some commands you could run to explore the db. (Can also explore the db using the dbt docs commands in the above section)

```show connections;```
- List Connections avaliable. Connections are connections to another system like postgres or kafka (this is where we connect to our serverless kafka, Upstash)

```show sources;```
- List Sources available. Sources are the first step of querying a connection. This is the first portion of the process where data is exposed

```show materialized views;```
- List Materialized views available. Materialized Views are updated as new data comes in. This is what we are using for real time driver location

```show views;```
- List Views available. Views are only updated when queried

you can then 



## Making Changes to the SQL / Tables powering Materialize
Steps to view this locally and deploy changes. Feel free to ask Clayton any questions on this

1. Setup Python environment
2. Clone this repository
3. ```pip install dbt-materialize```
4. configure profiles.yml file with materialize connection
5. make changes in repo (the models are stored in the models/sources and models/materializedviews paths)
    The name of the file is the name of the table in the database
7. (optional) ```dbt docs generate```
8. (optional) ```dbt docs serve``` (this allows you to view the docs and lineage graph of data flow)
9. ```dbt run``` - this is what executes the SQL stored in the models/ folders on the database
10. push changes back to remote branch
