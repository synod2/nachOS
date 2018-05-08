FROM i386/ubuntu:trusty

LABEL maintainer="Maojui <maojui0427@gmail.com>"

# ==== Start Installation of requirements ====
RUN apt update && apt install -y \
    ed \
    g++ \
    csh \
    make \

RUN wget 
# ==== End Installation of requirements ====

# Done!