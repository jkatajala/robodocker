DOCKER_TAG 			:= latest
DOCKER_IMAGE		:= demoapp
INSTANCE_NAME		:= my-demoapp
DOCKER_TEST_IMAGE 	:= robot-docker
TEST_INSTANCE_NAME	:= my-robot-docker

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) ./demoapp

build_tests:
	docker build -t $(DOCKER_TEST_IMAGE):$(DOCKER_TAG) ./robot

build_all: build build_tests

run:
	docker run --rm -dit -p 80:80 --name $(INSTANCE_NAME) $(DOCKER_IMAGE):$(DOCKER_TAG)
	@docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(INSTANCE_NAME)

run_tests:
	$(eval TARGET_IP=$(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(INSTANCE_NAME)))
	docker run --rm -v ${PWD}/robot/reports:/root/robotframework_test/reports \
		-e TARGET_IP=$(TARGET_IP) robot-docker:latest

stop:
	docker stop ${INSTANCE_NAME}

clean: stop
	docker rmi -f $(DOCKER_IMAGE):$(DOCKER_TAG)
	docker rmi -f $(DOCKER_TEST_IMAGE):$(DOCKER_TAG)
