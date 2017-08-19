APPname="$(pwd | sed 's_.*/__')"
APPdir="/root/$APPname/$APPname-code/"

case $1 in
	'build')
	docker build -t ionic-android-image .
	;;

	'run')
	docker run -td --name $APPname -h $APPname -p 8100:8100 -p 35729:35729 --privileged -v /dev/bus/usb:/dev/bus/usb -v $APPdir:/root/$APPname -w /root/$APPname ionic-android-image /bin/bash
	;;

	'enter')
	docker exec -it ionic /bin/bash
	;;

	*)
	echo 'Usage: source docker.sh <build|run|enter>'
esac	
