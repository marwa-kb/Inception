sudo docker build -t $1 .
sudo docker run -it -d -p 9000:80 $1