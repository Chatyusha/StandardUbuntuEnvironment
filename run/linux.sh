#!/bin/bash

ARCH="$(uname -m)"
sudo docker run -it -w /root --name LinuxSummer2021 unicatflower/standard-ubuntu-environment:$ARCH
