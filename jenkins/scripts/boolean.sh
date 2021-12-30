#!/bin/bash

NAME=$1
LASTNAME=$2
SHOW=$3

if [ "$SHOW" = "true" ]; then
    echo "Hello, $NAME $LASTNAME"
else
    echo "Please pass the show option"
fi
