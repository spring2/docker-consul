$build="0.7.3"
docker build -t spring2/consul:$build .
docker tag spring2/consul:$build spring2/consul:latest

docker push spring2/consul:$build
docker push spring2/consul:latest
