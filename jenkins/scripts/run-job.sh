#!/bin/bash

crumb=$(curl -u "$1:$2" -s 'http://localhost:8081/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)') &&
    echo "Running job..." &&
    curl -u "$1:$2" -H "$crumb" -X POST http://localhost:8081/job/demo-ENV/build\?delay\=0sec &&
    echo "Success"
