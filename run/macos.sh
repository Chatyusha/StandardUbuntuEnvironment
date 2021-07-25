#!/bin/bash

ARCH="$(uname -m)"
sudo docker run -it -w /root --memory=256mb --name LinuxSummer2021 unicatflower/standard-ubuntu-environment:$ARCH
