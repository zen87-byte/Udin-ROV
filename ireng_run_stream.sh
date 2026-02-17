#!/bin/bash

# Setting IP GCS
IP_LAPTOP="192.168.50.1"
PORT="5000"

echo "Starting video stream to GCS $IP_LAPTOP..."

gst-launch-1.0 v4l2src device=/dev/video4 ! \
video/x-raw,width=1280,height=720,framerate=30/1 ! \
videoconvert ! \
x264enc tune=zerolatency bitrate=15000 speed-preset=ultrafast key-int-max=30 ! \
rtph264pay pt=96 config-interval=1 mtu=1400 ! \
udpsink host=$IP_LAPTOP port=$PORT
