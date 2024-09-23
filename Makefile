createdb:
	docker exec -it postgresql createdb --username=admin --owner=admin simple_bank

dropdb:
	docker exec -it postgresql dropdb --username=admin simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://admin:secret@localhost:5432/simple_bank?sslmode=disable" --verbose up

migratedown:
	migrate -path db/migration -database "postgresql://admin:secret@localhost:5432/simple_bank?sslmode=disable" --verbose down

.PHONY: createdb dropdb migrateup migratedown
