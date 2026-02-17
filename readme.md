# UdinROV (Remotely Operated Vehicle)
## Prerequisite
This section contains the hardware and software that UdinROV use.

### Hardware
1. GCS Ubuntu 25.10 
2. Pixhawk px4 2.4.8 (Ardusub v4.5.6)
3. Raspberry Pi 4B 8 GB (Ubuntu Server 22.04.1 LTS)
4. Ethernet Cable for GCS-Raspi connection.
5. USB Cable for Raspi-Pixhawk Connection
### Software
1. QGround Control (GCS)
2. ROS 2 Humble (ireng-pi)
3. MAVros / ROS 2 (GCS)

## __Ground Control Station__
### Ethernet Address: 
`192.168.50.1`
### Subnet
 `255.255.255.0`

## __SBC ireng-pi__
### Ethernet address
`192.168.50.2`
### Realsense RGB 
`device=/dev/video4`

### Connect SSH: 
1. Using mDNS`ssh ireng@ireng-pi.local` 
2. Using ethernet Direct`ssh ireng-pi` or `ssh ireng@192.168.50.2`

### Shell Script
1. `ireng_run.sh`: This is the main command to execute all of the UdinROV run.
2. `ireng_run_mavros.sh`: Command to execute mavros protocol to communicate between pixhawk and GCS via raspi over UDP
3. `ireng_run_stream.sh`: Command to open live streaming from realsense to GCS

## __How To Start UdinROV__
Pixhawk can connect to QGC via ireng-pi ethernet UDP over port 14550. The data flow is send using MAVLink (Micro Air Vehicle Link) protocol using MAVros. The GCS just listen to the port and the raspi will sending the information through it. <br>
1. On the GCS, run QGC and connect to ireng-pi SSH using `./ireng_start.sh`. This script also opening GNOME-terminal for ireng-pi monitoring. 
2. Input SSH password `ireng++`. The ireng-pi will execute `./ireng_run.sh` automatically. This shell script will execute `ireng_run_mavros.sh` and `ireng_run_stream.sh` automatically.
3. Input SSH password in GNOME-Terminal and automatically opening raspi hardware monitoring.
