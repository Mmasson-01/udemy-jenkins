#!/bin/bash

crumb=$(curl -u "$1:$2" -s 'http://localhost:8081/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)') &&
    echo "Running job..." &&
    curl -u "$1:$2" -H "$crumb" -X POST http://localhost:8081/job/demo-param/buildWithParameters?FIRSTNAME=Ron&LASTNAME=Masson&delay=0s &&
    echo "Success"
