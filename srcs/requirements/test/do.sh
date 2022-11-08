sudo docker build -t test .
sudo docker run -d -p 443:443 --name ngx test
sudo docker exec -it ngx sh