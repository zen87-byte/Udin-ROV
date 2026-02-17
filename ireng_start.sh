#!/bin/bash

gnome-terminal --title="UdinROV" -- bash -c \
"ssh -t ireng@ireng-pi 'bash -lc ~/ireng_run.sh'; exec bash"

sleep 3

gnome-terminal -- bash -c \
"ssh -t ireng@ireng-pi 'watch -n 1 \"vcgencmd measure_temp && uptime && free -h\"'"

sleep 3

~/Downloads/QGroundControl.AppImage &

gst-launch-1.0 udpsrc port=5000 caps="application/x-rtp, media=video, clock-rate=90000, encoding-name=H264, payload=96" ! \
rtpjitterbuffer latency=0 ! \
rtph264depay ! \
decodebin ! \
videoconvert ! \
autovideosink sync=false