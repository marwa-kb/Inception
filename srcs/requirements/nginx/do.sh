sudo docker build -t ng .
sudo docker run -d -p 443:443 --name ngx ng
sudo docker exec -it ngx sh