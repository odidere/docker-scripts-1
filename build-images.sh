echo -e '\nDownloading alpine...'
docker pull alpine

echo -e '\nBuilding tsaqib/wrk-alpine...'
cd wrk-alpine && ./build.sh && cd ..

echo -e '\nBuilding tsaqib/stress-alpine...'
cd stress-alpine && ./build.sh && cd ..

echo -e '\nBuilding tsaqib/nmap-alpine...'
cd nmap-alpine && ./build.sh && cd ..

echo 'Completed.'