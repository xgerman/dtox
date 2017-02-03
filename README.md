# dtox
Tox in Docker

This will run tox in a docker environent and install some
packages whoich are useful when doing OpenStack work

## Build
docker build -t dtox .

## Run
In the source directory (where tox.ini resides):
docker run --rm -v `pwd`:/src dtox

or

docker run --rm -v `pwd`:/src dtox tox -epep8

