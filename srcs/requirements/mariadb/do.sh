sudo docker build -t mdb .
sudo docker run -d -p 3306:3306 --name mdbc mdb
sudo docker exec -it mdbc sh