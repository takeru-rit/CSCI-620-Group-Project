To use run the command 'docker-compose up -d' in the root directory of the project.
This will start the PostgreSQL database in a Docker container. The code will already
automatically create the database and tables. 

Make sure that you run Generate Data.ipynb first to create the synthetic data.

It will also start PGAdmin at http://localhost:15433. You can log in with the credentials:

- **Username**: `admin@example.com`
- **Password**: `yourpassword`

You can then connect to the PostgreSQL database using the following details:
- **Password**: `postgres`