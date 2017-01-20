$build="2"
docker -H vdc-qasapptst02 build -t spring2/consul:$build .
docker -H vdc-qasapptst02 tag spring2/consul:$build spring2/consul:latest
