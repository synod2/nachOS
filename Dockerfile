#docker build --no-cache -t nachos .
#docker run -it
FROM i386/ubuntu:bionic
LABEL   maintainer="synod2 <synod2@naver.com>" \
        version="0.0.1" \
        date="2019-04-28" 
# ============ Start Installation  ============
RUN apt-get update && apt-get install -y \
    ed \
    g++ \
    csh \
    make \
    wget \
    && rm -rf /var/lib/apt/lists/*
# Get the nashOS source
RUN wget https://github.com/synod2/nachOS/blob/master/nachos-4.0.tar.gz?raw=true -O nachos-4.0.tar.gz
RUN wget https://github.com/synod2/nachOS/blob/master/nachos-lib.tar?raw=true -O nachos-lib.tar
RUN wget https://github.com/synod2/nachOS/blob/master/binutils-2.11.2.tar.gz?raw=true -O binutils-2.11.2.tar.gz

# Unzip
RUN tar -zxvf nachos-4.0.tar.gz && tar -xvf nachos-lib.tar
RUN tar -zxvf binutils-2.11.2.tar.gz

# install binutils 
RUN cd /binutils-2.11.2 && ./configure --prefix=/usr/local --target=decstation-ultrix
RUN cd /binutils-2.11.2 && make

# Put them into right place
RUN mv nachos /usr/local/nachos
# Compile
RUN cd nachos-4.0/code && make
# ============ End Installation  ============s
