# Dockerized Robot Framework demo

Based on [Robot Framework Demo](https://bitbucket.org/robotframework/robotdemo)

## Quick guide

```
make build_all
make run
make run_tests
```

Results appear under _robot/reports/_

## Running on Jenkins

You need:
1. Jenkins (obviously)
2. Pipeline plugin
3. Jenkins slave node with Docker and make installed
4. Above mentioned slave node labeled with 'jenkins-slaves'

Easiest way to run is to install Blue Ocean plugin and let it handle configuration.
