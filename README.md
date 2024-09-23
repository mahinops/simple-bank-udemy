# Simple Bank Project from Udemy Course
[Backend Master Class [Golang + Postgres + Kubernetes + gRPC]](https://www.udemy.com/course/backend-master-class-golang-postgresql-kubernetes/?couponCode=ST22MT92324A)


## Functionalities_

Create and manage account
  - Owner, balance, currency

Record all balance changes
  - Create an account entry for each change. 

Money transfer transaction
  - Perform money transfer between 2 accounts consistently within a transaction.



## DATABASE DESIGN

Design DB Schema
  - Design a SQL DB schema using dbdiagram.io
  - [DB Schema Link in DB Diagram](https://dbdiagram.io/d/SimpleBank-65fe1b21ae072629cec03ad1)

Save and share DB diagram
  - Save the DB schema as PDF/PNG diagram and share it within the team.

Generate SQL code
  - Generate code to create the schema in a target database engine: Postgres/MySQL/SQL Server


[DB Schema Link in DB Diagram](https://dbdiagram.io/d/SimpleBank-65fe1b21ae072629cec03ad1)



## Depencies to install
1. Golang
2. Sqlc - Generate Golang to from SQL Queries.
3. Install [golang-migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate) for migration.


To generate migrations file using golang-migrate

```
migrate create -ext sql -dir db/migration -seq init_schema
```

Here 2 migrations file will be create. 
1. up - to make a forward change to the schema
2. down - if want to revert the change run by upscript

migrate up - command will migrate the sql script to the db. so sql db file need to be in the up.sql file. 
migrate down - will revert. 

Do DB migrations_
```
migrate -path db/migration -database "postgresql://admin:secret@localhost:5432/simple_bank?sslmode=disable" --verbose up
```










---
Concept that will be covered here_

### Database Transaction. 

  Why:
  - To provice a reliable and consistent unit of work, even in case of system failure. 
  - To provide isolation between programs that access the database concurrently. 
  
To achieve this goals, DB Transaction must satisfy ACID properties. 

- **A(Atomicity):** Either all operations complete successfully or the tansaction fails and the db is unchanged.

- **C(Consistency):** The db state must be valid after the transaction. All constraints must be satisfied. 

- **I(Isolation):** Concurrent transactions must not affect each other.

- **D(Durability):** Data written by a successful transaction must be recorded in persistent storage.


## How to write a SQL DB transactions_

```
BEGIN;
---
queries
---
COMMIT;
```

If queries failed_

```
BEGIN;
---
---
ROLLBACK;
```







