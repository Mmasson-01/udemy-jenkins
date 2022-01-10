#!/bin/bash

# Get branch name from ref head
if ! [ -t 0 ]; then
    read -a ref
fi
IFS='/' read -ra REF <<<"${ref[2]}"
branch="${REF[2]}"

if [ "$branch" == "master" ]; then
    crumb=$(curl -u "jenkins:jenkins123" -s 'http://localhost:8081/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
    curl -u "jenkins:jenkins123" -H "$crumb" -X POST http://localhost:8081/job/demo-maven-dsl/build\?delay\=0sec

    if [ $? -eq 0 ]; then
        echo "*** OK"
    else
        echo "*** ERROR"
    fi
fi
