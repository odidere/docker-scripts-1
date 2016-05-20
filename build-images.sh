#docker login

echo -e '\nBuilding tsaqib/wrk-alpine...'
cd wrk-alpine && ./build.sh && cd ..

echo -e '\nBuilding tsaqib/stress-alpine...'
cd stress-alpine && ./build.sh && cd ..

echo 'Completed.'