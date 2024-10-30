

build:
	docker image build -t localhost/linuxtips-giropops-senhas:1.0 -t docker.io/helber/linuxtips-giropops-senhas:1.0 .
upload:
	docker image push docker.io/helber/linuxtips-giropops-senhas:1.0

run:
	docker network create giropopsenhas
	docker container run --detach --name redis-service --network giropopsenhas redis
	docker container run --detach --name giropops -e REDIS_HOST=redis-service --link redis-service --network giropopsenhas -p 8081:5000 helber/linuxtips-giropops-senhas:1.0
clean:
	docker container kill redis-service giropops
	docker container rm redis-service giropops
	docker network rm giropopsenhas