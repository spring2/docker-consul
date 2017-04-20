#https://github.com/StefanScherer/dockerfiles-windows/tree/master/consul
FROM microsoft/nanoserver
ENV CONSUL_VERSION 0.8.1

RUN powershell -Command $ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; \
    Invoke-WebRequest $('https://releases.hashicorp.com/consul/{0}/consul_{0}_windows_amd64.zip' -f $env:CONSUL_VERSION) -OutFile 'consul.zip' -UseBasicParsing ; \
    Invoke-WebRequest $('https://releases.hashicorp.com/consul/{0}/consul_{0}_web_ui.zip' -f $env:CONSUL_VERSION) -OutFile 'webui.zip' -UseBasicParsing ; \
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; \
    Expand-Archive -Path webui.zip -DestinationPath \dist -Force ; \
    rm consul.zip ; \
    rm webui.zip

ADD ./config /config/

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
#VOLUME ["/data"]

ENTRYPOINT ["c:/consul.exe"]
