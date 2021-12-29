hello:
	echo hello

linux_test:
	docker-compose run linux mix test

mac_test:
	mix test
