hello:
	echo "hello"

docker:
	docker run --rm -v $(pwd)/data/pg:/var/lib/postgresql/data --name postgresdb -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres postgres:11    Process.exit(self(), :kill)
