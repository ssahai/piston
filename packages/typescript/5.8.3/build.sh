#!/usr/bin/env bash

source ../../node/22.16.0/build.sh

source ./environment

bin/npm install -g typescript@5.8.3
bin/npm install --save-dev @types/node
