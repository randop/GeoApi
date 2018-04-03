#!/bin/bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  DIR="$(pwd)"
  cd ..
  export SWIFT_VERSION=swift-4.1-RELEASE
  wget https://swift.org/builds/swift-4.1-release/ubuntu1404/swift-4.1-RELEASE/swift-4.1-RELEASE-ubuntu14.04.tar.gz
  tar xzf swift-4.1-RELEASE-ubuntu14.04.tar.gz
  export PATH="${PWD}/swift-4.1-RELEASE-ubuntu14.04/usr/bin:${PATH}"
  cd "$DIR"
else
  export SWIFT_VERSION=swift-4.1-RELEASE
  curl -O https://swift.org/builds/swift-4.1-release/xcode/swift-4.1-RELEASE/swift-4.1-RELEASE-osx.pkg
  sudo installer -pkg swift-4.1-RELEASE-osx.pkg -target /
  export TOOLCHAINS=swift
fi
