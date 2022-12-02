Steps to view this locally and deploy changes. Feel free to ask Clayton any questions on this

1. Setup Python environment
2. Clone this repository
3. pip install dbt-materialize
4. configure profiles.yml file with materialize connection
5. make changes in repo
6. dbt docs generate
7. dbt docs serve (this allows you to view the docs and lineage graph of data flow)
8. dbt run
9. push changes back to remote branch
