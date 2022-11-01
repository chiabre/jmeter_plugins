#!/bin/bash

JMETER_VERSION="5.5"
OPENJDK_VERSION="11"
IMG_VERSION="0.1.1"

# Example build line
docker build --network host --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} -t "chiabre/jmeter_plugins:${JMETER_VERSION}-${IMG_VERSION}" .
