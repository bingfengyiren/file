if [ $# != 2 ];
then
	echo "1:file name\n2:action"
	echo "push:push your file to server!"
	echo "down:down file from this server!"
	exit
fi


FILE=$1
ACTION=$2
if [ $ACTION = "push" ];
then
	nc -l 4444 > $1 & 
elif [ $ACTION = "down" ];
then
	tar -cvzf $1.tar.gz $1
	nc -l 4444 < $1.tar.gz &	
fi

