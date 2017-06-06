FROM ubuntu:trusty
RUN echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu trusty main" > /etc/apt/sources.list.d//mozillateam-firefox-next-trusty.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE49EC21
RUN apt-get update
RUN apt-get install -y firefox xvfb python-pip
RUN apt-get install -y wget vim
RUN pip install robotframework
RUN pip install robotframework-selenium2library
RUN pip install robotframework-xvfb
RUN wget -qO- https://github.com/mozilla/geckodriver/releases/download/v0.16.0/geckodriver-v0.16.0-linux64.tar.gz | tar -xz -C /usr/bin/

COPY tests/login_tests /root/robotframework_test/login_tests

COPY runtests.sh /root/robotframework_test/runtests.sh
RUN chmod a+x /root/robotframework_test/runtests.sh

WORKDIR /root/robotframework_test

CMD /root/robotframework_test/runtests.sh
