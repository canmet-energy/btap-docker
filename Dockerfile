ARG DOCKER_OPENSTUDIO_VERSION=3.0.1
FROM canmet/docker-openstudio:3.0.1
ARG gitok='nothing'
MAINTAINER Phylroy Lopez phylroy.lopez@canada.ca
ARG DISPLAY=host.docker.internal
ENV DISPLAY ${DISPLAY}
ENV RUBYLIB=/usr/local/openstudio-3.0.1/Ruby:/usr/Ruby
USER  root
WORKDIR /
RUN git clone -b master https://$gitok:x-oauth-basic@github.com/canmet-energy/btap_public_cli.git
WORKDIR /btap_public_cli
RUN mkdir output
RUN bundle install
CMD ["/bin/bash"]		`	