docker login

echo 'Building tsaqib/wrk-alpine...'
cd wrk-alpine && ./build.sh && cd ..

echo 'Building tsaqib/stress-alpine...'
cd stress-alpine && ./build.sh && cd ..

echo 'Completed.'