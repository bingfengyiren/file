#!/bin/sh
if [ $# != 2 ];
then
	echo "1:file\n2:action"
	echo "push:push file from this server to other!"
	echo "down:down file from other server to this!"
fi

IP="172.16.-.-"
FILE=$2

if [ "$2" = "push" ];
then
	tar -cvzf $1.tar.gz $2
	nc $IP 4444 < $1.tar.gz
	rm -rf $2.tar.gz
elif [ "$2" = "down" ];
then
	nc $IP 4444 > $1.tar.gz
	tar -zxf $1.tar.gz
	rm -rf $1.tar.gz
fi
	
