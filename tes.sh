// Raspi
gst-launch-1.0 v4l2src device=/dev/video4 ! video/x-raw,width=1280,height=720,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=15000 speed-preset=ultrafast key-int-max=30 ! rtph264pay pt=96 config-interval=1 mtu=1400 ! udpsink host=192.168.50.1 port=5000

// GCS
gst-launch-1.0 udpsrc port=5000 caps="application/x-rtp, media=video, clock-rate=90000, encoding-name=H264, payload=96" ! rtpjitterbuffer latency=0 ! rtph264depay ! decodebin ! videoconvert ! autovideosink sync=false

