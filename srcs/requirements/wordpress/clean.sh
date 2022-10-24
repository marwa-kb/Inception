sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $1

if [ "$2" = "do" ]
then
    ./do.sh $1
fi