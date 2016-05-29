dock() { 
	docker-machine start 
	docker-machine ls 
}

# -------- Containers
cont() {
	docker run -it $1 sh
}

conts() {
	docker ps -a
}

contsh() {
	docker exec -it $1 sh
}

contlogs() {
	docker logs -f $1
}

rmcont() {
	docker rm -f $1
}

rmconts() {
	docker rm -f $(docker ps -a -q)
}

# -------- Images
imgs() {
	docker images -a
}

rmimg() {
	docker rmi -f $1
}

rmimgs() {
	docker rmi $(docker images -q)
}

rmnone() {
	docker rmi -f $(imgs | grep '<none>' | awk '{print $3}')	
	docker rmi $(docker images -q --filter "dangling=true")
}

# -------- General commands
get() {
	docker run --rm -v "$PWD":/usr/local/ -w /usr/local/ alpine wget $@
}

# -------- Applications
odoo9() {
	docker rm -f odoodb odoo9
	echo -e '\n----- addon directory: '$PWD' and conf directory: '$PWD'/conf'
	echo -e '----- Once setup, navigate to http://'$(docker-machine ip):10101'\n'
	docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name odoodb postgres
	docker run -it -p 10101:8069 -v "$PWD":/mnt/extra-addons -v "$PWD"/conf:/etc/odoo --name odoo9 --link odoodb:db -t odoo
}

odoo9p() {
	echo -e '\n----- addon directory: '$PWD' and conf directory: '$PWD'/conf'
	echo -e '----- Once setup, navigate to http://'$(docker-machine ip)':'$1'\n'
	docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name odoodb postgres
	docker run -it -p $1:8069 -v "$PWD":/mnt/extra-addons -v "$PWD"/conf:/etc/odoo --link odoodb:db -t odoo
}

bahmni() {
	echo 'Does not work yet!'
	docker rm -f bahmni 
	echo -e '\n----- Once setup, navigate to http://'$(docker-machine ip):10201'\n'
	docker run -it -p 10201:8069 --name bahmni bahmni/bahmni
}

# -------- Development
springb() {
	springbp $1 10301
}

springbp() {
	echo -e '\n----- Assuming current directory has pom.xml, so that it can be built.'
	echo -e '----- Usage: springboot target/app.jar (future path)'
	echo -e '----- Once done, navigate to http://'$(docker-machine ip)':'$2'/'
	
	docker run --rm -p $2:8080 -v "$PWD":/usr/src/ -w /usr/src/ tsaqib/springboot-alpine sh -c "mvn package; java -jar $1"
	
	#springbootexists="$(docker inspect springboot)"
	#if [ "$springbootexists" == "[]" ]; then
	#else
	#	docker start -a springboot 
	#fi
}

springbd() {
	springbdp 10301
}

springbdp() {
	springbp target/gs-spring-boot-0.1.0.jar $1
}

py() {
	docker run --rm -v `pwd`:/usr/local/website -w /usr/local/website tsaqib/py-alpine python $@
}

pg() {
	echo -e '\n----- Once setup, connect to '$(docker-machine ip)':10301 with user=postgres, password=postgres\n'
	docker run --name=postgres -e POSTGRES_PASSWORD=postgres -p 10301:5432 -d postgres
}

pgp() {
	echo -e '\n----- Once setup, connect to '$(docker-machine ip)':'$3' with user='$1', password='$2'\n'
	docker run -e POSTGRES_USER=$1 -e POSTGRES_PASSWORD=$2 -p $3:5432 -d postgres
}

simws() { 
	docker rm -f $(docker ps -a | grep ':8000->' | awk '{print $1}')
	echo -e '\n----- (known issue of aggressive caching) Once setup, navigate to http://'$(docker-machine ip):8000'\n'
	docker run --rm -p 8000:8000 -v "$PWD":/usr/src/ -w /usr/src/ tsaqib/py-alpine python -m SimpleHTTPServer 8000  
}

simwsp() { 
	docker rm -f $(docker ps -a | grep ':$1->' | awk '{print $1}')
	echo -e '\n----- Once setup, navigate to http://'$(docker-machine ip)':'$1'\n'
	docker run --rm -p $1:8000 -v "$PWD":/usr/src/ -w /usr/src/ tsaqib/py-alpine python -m SimpleHTTPServer 8000
}

alpine() {
	docker run -it alpine sh
}

# -------- Testing
wrk() { 
	docker run --rm tsaqib/wrk-alpine $@
}

stress() { 
	docker run --rm tsaqib/stress-alpine $@
}

ab() { 
	docker run --rm jess/ab $@
}

wpscanu() {
	docker run --rm evild/alpine-wpscan wpcan --update
}

wpscan() {
	echo 'Do not forget to execute "wpscanu" to perform an update first. Scanning now...'
	docker run --rm evild/alpine-wpscan wpcan -u $1 -r -e p,t,u --follow-redirection --batch
}

nmap() {
	docker run --rm tsaqib/nmap-alpine $@
}

dock
eval "$(docker-machine env default)"


