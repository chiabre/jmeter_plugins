#!/bin/bash

JMETER_VERSION="5.4.1"
OPENJDK_VERSION="15"
IMG_VERSION="0.1.0"

# Example build line
docker build --network host --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} -t "chiabre/jmeter_plugins:${JMETER_VERSION}-${IMG_VERSION}" .
