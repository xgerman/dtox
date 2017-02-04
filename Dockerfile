FROM ubuntu:14.04
MAINTAINER German Eichberger 

# ensure the base image has what we need
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
    build-essential python-pip software-properties-common \
    python-dev libxml2-dev libxslt-dev  python3-dev git \
    libssl-dev libffi-dev


# install tox
RUN pip install tox

ADD clean-launch.sh /tools/clean-launch.sh

VOLUME /src
WORKDIR /src

ENTRYPOINT ["/tools/clean-launch.sh"]
CMD ["tox"]
