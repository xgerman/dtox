FROM ubuntu:16.04
MAINTAINER German Eichberger <german.eichberger@gmail.com>

# ensure the base image has what we need
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
    build-essential python-pip software-properties-common \
    python-dev libxml2-dev libxslt-dev  python3-dev git \
    libssl-dev libffi-dev  python3.5-gdbm


# install tox
RUN pip install tox

ADD clean-launch.sh /tools/clean-launch.sh

VOLUME /src
WORKDIR /src

ENTRYPOINT ["/tools/clean-launch.sh"]
CMD ["tox"]
