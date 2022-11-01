sudo docker build -t $1 .
sudo docker run -p 443:443 -it $1 sh