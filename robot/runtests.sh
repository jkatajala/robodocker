#!/bin/bash

# Start virtual display
Xvfb :10 -ac & export DISPLAY=:10
TIMESTAMP=`date +%Y%m%d-%H%M%S`
mkdir reports/$TIMESTAMP
robot --outputdir reports/$TIMESTAMP --variable SERVER:$TARGET_IP login_tests
