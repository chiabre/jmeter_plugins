#!/bin/bash

JMETER_VERSION="5.6.3"
OPENJDK_VERSION="17"
IMG_VERSION="0.1.4"

# Example build line
docker build --no-cache --progress=plain --network host --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} -t "chiabre/jmeter_plugins:${JMETER_VERSION}-${IMG_VERSION}" .
