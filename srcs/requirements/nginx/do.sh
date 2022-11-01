sudo docker build -t $1 .
sudo docker run -it -p 443:443 $1 sh