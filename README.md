Steps to view this locally and deploy changes. Feel free to ask Clayton any questions on this

1. Setup Python environment
2. Clone this repository
3. pip install dbt-materialize
4. configure profiles.yml file with materialize connection
5. make changes in repo (the models are stored in the models/sources and models/materializedviews paths)
    The name of the file is the name of the table in the database
7. (optional) dbt docs generate
8. (optional) dbt docs serve (this allows you to view the docs and lineage graph of data flow)
9. dbt run - this is what executes the SQL stored in the models/ folders on the database
10. push changes back to remote branch
