FROM ubuntu:latest

ARG USERNAME=KCN
ARG PASSWORD=TasteLikeAlmond
ARG UID=1000
ARG GID=1000

SHELL ["/bin/bash", "-c"]

RUN apt-get update  
RUN apt-get upgrade -y

RUN yes | unminimize
RUN apt-get install -y file sudo curl wget tzdata man

ENV TZ Asia/Tokyo
ENV XDG_CONFIG_HOME ~/.config

RUN useradd -m -s /bin/bash $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    gpasswd -a $USERNAME sudo

# C/C++ etc...
RUN apt-get install -y gcc clang 

# Python3
RUN apt-get install -y python3 python3-venv python3-pip
RUN pip3 install numpy pillow

# Nodejs
RUN apt-get install -y nodejs npm

# Ruby
RUN apt-get install -y ruby gem

# Neovim
RUN apt-get install -y neovim

RUN mkdir -p ~/.config/nvim

RUN echo "# neovim init" > ~/.config/nvim/init.vim

#Python3 Client
RUN cd ~/.config/nvim
RUN python3 -m venv python3
RUN source ./python3/bin/activate
RUN pip3 install pynvim
RUN deactivate
RUN echo "let g:python3_host_prog = $(pwd)/python3/bin/python"

# git
RUN apt-get install -y git

CMD login
