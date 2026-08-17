docker rm -f jenkins-docker-app || true
docker run -d --name jenkins-docker-app -p 8081:80 jenkins-docker-app:latest
docker ps
