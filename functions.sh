wrk() { 
	docker run --rm tsaqib/wrk-alpine $@; 
}

imgs() {
	docker images -a
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

delconts() {
	docker rm -f $(docker ps -a -q)
}

delimg() {
	docker rmi -f $1
}

delimgs() {
	docker rmi $(docker images -q)
}

eval "$(docker-machine env default)"
