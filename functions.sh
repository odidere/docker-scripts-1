dock() { 
	docker-machine start 
	docker-machine ls 
}

# -------- Containers
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

# -------- Images
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

# -------- Development
py() {
	docker run --rm -v `pwd`:/usr/local/website -w /usr/local/website tsaqib/py-alpine python $@
}

simws() { 
	docker rm -f $(docker ps -a | grep ':8000->' | awk '{print $1}')
	echo -e '\n----- (known issue of aggressive caching) Now browse to http://'$(docker-machine ip):8000' -----\n'
	docker run --rm -p 8000:8000 -v "$PWD":/usr/src/ -w /usr/src/ tsaqib/py-alpine python -m SimpleHTTPServer 8000  
}

simwsp() { 
	docker rm -f $(docker ps -a | grep ':$1->' | awk '{print $1}')
	echo -e '\n----- Now browse to http://'$(docker-machine ip)':'$1' -----\n'
	docker run --rm -p $1:8000 -v "$PWD":/usr/src/ -w /usr/src/ tsaqib/py-alpine python -m SimpleHTTPServer 8000
}

# -------- Testing
wrk() { 
	docker run --rm tsaqib/wrk-alpine $@
}

stress() { 
	docker run --rm tsaqib/stress-alpine $@
}

dock
eval "$(docker-machine env default)"
