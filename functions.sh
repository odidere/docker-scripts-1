wrk() { 
	docker run --rm tsaqib/wrk-alpine $@; 
}

stress() { 
	docker run --rm tsaqib/stress-alpine $@; 
}

py() {
	docker run --rm -p 8000:8000 -v `pwd`:`pwd` -w `pwd` tsaqib/py-alpine python $@
}

simws() { 
	echo 'Turns the current directory into a simple HTTP server.'
	docker rm -f $(docker ps -a | grep :8000-> | awk '{print $1}')
	docker run --rm -p 8000:8000 -v `pwd`:`pwd` -w `pwd` tsaqib/py-alpine python -m SimpleHTTPServer 8000 
}

simwsp() { 
	echo 'Turns the current directory into a simple HTTP server at a specified port.'
	docker rm -f $(docker ps -a | grep :$1-> | awk '{print $1}')
	docker run --rm -p $1:8000 -v `pwd`:`pwd` -w `pwd` tsaqib/py-alpine python -m SimpleHTTPServer $1 
}

conts() {
	docker ps -a
}

contbash() {
	docker exec -it $1 /bin/bash
}

contlogs() {
	docker logs -f $1
}

delcont() {
	docker rm -f $1
}

delconts() {
	docker rm -f $(docker ps -a -q)
}

imgs() {
	docker images -a
}

delimg() {
	docker rmi -f $1
}

delimgs() {
	docker rmi $(docker images -q)
}

delnone() {
	docker rmi -f $(imgs | grep '<none>' | awk '{print $3}')	
}

echo 'Starting Docker...'
docker-machine start
eval "$(docker-machine env default)"
