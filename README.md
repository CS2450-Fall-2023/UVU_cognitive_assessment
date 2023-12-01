# UVU_cognitive_assessment

To start up, go to the docker-compose.yml file and input the username, password, and port you want\
to use for the database. If you have no other local postgres instances on port 5432, you can delete\ 
the ```command: -p 5434``` section and keep
```
ports:
  - "5432:5432"
```
Otherwise, set the port numbers to what you want it to redirect to.\
Then, in a terminal, run\
```docker compose up flask_db```\
Check that it is running fine, it should say it is ready to accept connections at the bottom.\
Then, in a new terminal, run\
```docker compose build```\
You should now be able to see the container with\
```docker images```\
Final, run\
```docker compose up flask_app```\
And everything should be up and running.\
When building subsequent times, you only need\
```docker compose up flask_db``` and ```docker compose up flask_app```

If it is your first time running the database, paste the sql commands in the database_init.sql
file into postgres console.