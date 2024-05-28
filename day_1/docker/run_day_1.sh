#!/bin/bash

docker run -p 6080:80 --privileged -env="DISPLAY=$DISPLAY" --env="NVIDIA_DRIVER_CAPABILITIES=all"   --runtime=nvidia  --gpus all --name day_1 -d day1:v1

