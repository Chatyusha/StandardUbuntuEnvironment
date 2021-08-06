FROM ubuntu:latest

ARG USERNAME=KCN
ARG PASSWORD=TasteLikeAlmond


RUN apt-get update  
RUN apt-get upgrade -y

RUN yes | unminimize
RUN apt install -y file sudo curl wget tzdata man

ENV TZ Asia/Tokyo

RUN useradd -m -s /bin/bash $USERNAME && \
    gpasswd -a $USERNAME sudo && \
    echo $USERNAME:$PASSWORD | chpasswd

# C/C++ etc...
RUN apt install -y gcc clang 

# Python3
RUN apt install -y python3 python3-venv python3-pip
RUN pip3 install numpy
RUN pip3 install pillow

# Nodejs
RUN apt install -y nodejs npm

# Ruby
RUN apt install -y ruby gem

# Neovim
RUN apt install -y neovim

# git
RUN apt install -y git

