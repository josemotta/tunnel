FROM node:18.2.0-slim

WORKDIR /home

ARG ENCORE_MAIN=default

RUN sudo echo "$ENCORE_MAIN" > /home/encore_main.pem && \
    sudo chmod 400 /home/encore_main.pem && \
    sudo ssh -N -L 8182:encore-fan-development-instance-1.cubaxtzqr1qf.us-east-2.neptune.amazonaws.com:8182 ubuntu@192.0.138.9 -i /home/encore_main.pem & \
    tail -f /dev/null
