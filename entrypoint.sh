#!/bin/bash

set -euxo pipefail

if [ "$INPUT_COMPILER" != "master" ]; then
    pushd /opt/v
    git clean -xf
    git fetch
    git reset --hard origin/master
    git checkout "$1"

    make
    v -o v v.v
    sudo v symlink
    popd
else
    v up
fi

v $INPUT_ARGS $INPUT_FILE
