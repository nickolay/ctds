#!/bin/sh -e

if [ -z "$TRAVIS" ]; then
    echo "$0 should only be run in the Travis-ci environment."
    exit 1
fi

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    # Travis-ci doesn't support docker on OS X. Just verify ctds builds on OS X.
    CTDS_STRICT=1 pip3 install -v .
fi
