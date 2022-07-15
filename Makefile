build:
	docker build -f docker/Dockerfile . -t eznd/otus-msa-hw1:latest

push:
	docker push eznd/otus-msa-hw1:latest

docker-start:
	docker run -p 8000:8000 -name otus-msa-hw1 -d eznd/otus-msa-hw1:latest

docker-stop:
	docker stop otus-msa-hw1

k8s-apply:
	kubectl apply -f k8s/

k8s-delete:
	kubectl delete deployment/otus-msa-hw1 service/otus-msa-hw1 ingress/ig-otus-msa-hw1 ingress/ig-otus-msa-hw1-rewrite

newman:
	newman run postman/collection.json