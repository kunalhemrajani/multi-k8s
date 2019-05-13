docker build -t kunalhemrajani/multi-client:latest -t kunalhemrajani/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kunalhemrajani/multi-server:latest -t kunalhemrajani/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kunalhemrajani/multi-worker:latest -t kunalhemrajani/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push kunalhemrajani/multi-client:latest
docker push kunalhemrajani/multi-server:latest
docker push kunalhemrajani/multi-worker:latest

docker push kunalhemrajani/multi-client:$SHA
docker push kunalhemrajani/multi-server:$SHA
docker push kunalhemrajani/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployment/server-deployment server=kunalhemrajani/multi-server:$SHA
kubectl set image deployment/client-deployment client=kunalhemrajani/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=kunalhemrajani/multi-worker:$SHA