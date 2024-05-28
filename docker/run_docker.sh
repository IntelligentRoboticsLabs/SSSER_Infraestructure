#!/bin/bash

xhost +
docker run -p 6080:80 --privileged -env="DISPLAY=$DISPLAY" --env="NVIDIA_DRIVER_CAPABILITIES=all" --env="NVIDIA_VISIBLE_DEVICES=all"  --runtime=nvidia  --gpus all --name day_1 -d day_1:v0.1
