#!/bin/bash

echo "Waiting for Pixhawk Connection..."
while [ ! -e /dev/ttyACM0 ]; do
  sleep 1
done
echo "Pixhawk is found! Running MAVROS..."

# MAVros Command
source /opt/ros/humble/setup.bash

ros2 run mavros mavros_node \
  --ros-args \
  -p fcu_url:=/dev/ttyACM0:115200 \
  -p gcs_url:=udp://@192.168.50.1:14550
