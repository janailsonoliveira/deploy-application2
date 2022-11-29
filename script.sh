#! /bin/bash

echo "Criando as imagens..."

docker build -t janailsonoliveira/projeto-backend;1.0 backend/.
docker build -t janailsonoliveira/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push janailsonoliveira/projeto-backend:1.0
docker push janailsonoliveira/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

