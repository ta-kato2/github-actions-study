FROM --platform=linux/amd64 ubuntu:latest
RUN apt-get -y update 
RUN apt-get -y install curl 
RUN apt-get -y install supervisor 
RUN apt-get -y install jq 

WORKDIR /tmp
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
COPY ./docker.conf /etc/default/docker

WORKDIR /actions-runner
RUN curl -o actions-runner-linux-x64-2.301.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.301.1/actions-runner-linux-x64-2.301.1.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.301.1.tar.gz
ENV RUNNER_ALLOW_RUNASROOT 1
RUN ./bin/installdependencies.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 
ENTRYPOINT [ "/docker-entrypoint.sh" ] 