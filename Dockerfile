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

RUN useradd -m ${USERNAME} --shell /bin/bash && \
    gpasswd -a ${USERNAME} sudo &&\
    echo ${USERNAME}:${PASSWORD} | chpasswd

#RUN useradd -m --uid ${UID} --groups sudo ${USERNAME} --shell /bin/bash && \
#    echo ${USERNAME}:${PASSWORD} | chpasswd

# C/C++ etc...
RUN apt-get install -y gcc clang 

# Python3
RUN apt-get install -y python3 python3-venv python3-pip
RUN pip3 install numpy pillow

# Nodejs
RUN apt-get install -y nodejs npm

# Ruby
RUN apt-get install -y ruby gem ruby-dev

# Neovim
RUN apt-get install -y neovim

# Neovim User Setting
USER KCN
RUN mkdir -p ~/.config/nvim

RUN echo "\" neovim init" > ~/.config/nvim/init.vim

# Python3 Client
RUN cd ~/.config/nvim && \
    python3 -m venv python3 && \
    source ./python3/bin/activate && \
    pip3 install wheel pynvim && \
    echo "let g:python3_host_prog = \"$(pwd)/python3/bin/python\"" >> ~/.config/nvim/init.vim

# Ruby Client
USER root
RUN gem install neovim

# Node.js Client
RUN npm install -g neovim

# git
USER root
RUN apt-get install -y git
