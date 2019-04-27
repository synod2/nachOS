#docker build -no-cache -t nachos . 
FROM i386/ubuntu:trusty
LABEL   maintainer="synod2 <synod2@naver.com>" \
        version="0.0.1" \
        date="2019-04-28" 
# ============ Start Installation  ============
RUN apt update && apt install -y \
    ed \
    g++ \
    csh \
    make \
    wget \
    && rm -rf /var/lib/apt/lists/*
# Get the nashOS source
RUN wget https://github.com/synod2/nachOS/blob/master/nachos-mod.tar?raw=true -O nachos-4.0.tar.gz
RUN wget https://github.com/synod2/nachOS/blob/master/nachos-lib.tar?raw=true -O nachos-lib.tar
# Unzip
RUN tar -zxvf nachos-4.0.tar.gz && tar -xvf nachos-lib.tar
# Put them into right place
RUN mv nachos /usr/local/nachos
# Compile
RUN cd nachos-4.0/code && make
# ============ End Installation  ============
