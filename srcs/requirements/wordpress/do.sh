sudo docker build -t $1 .
sudo docker run -p 80:80 -it $1 sh