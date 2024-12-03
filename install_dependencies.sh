#!/bin/bash

sudo apt update -y
# sudo apt upgrade -y #too long on RDS
sudo apt -y install libasio-dev


# Install project's dependencies 
sudo apt -y install ros-galactic-cv-bridge ros-galactic-camera-calibration-parsers
sudo apt -y install python3-colcon-common-extensions
sudo apt -y install python3-pip
sudo apt -y install ros-galactic-gazebo-ros-pkgs ros-galactic-cv-bridge
echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc

# Install opencv 
pip3 install opencv-contrib-python==4.7.0.72

# Install ros project
mkdir -p ~/tello_ros_ws/src
cd ~/tello_ros_ws/src
git clone https://github.com/JohvanyROB/tello_ros.git -b students
git clone https://github.com/ptrmu/ros2_shared.git
cd ~/tello_ros_ws
source /opt/ros/galactic/setup.bash
colcon build --symlink-install
echo "source ~/tello_ros_ws/install/setup.bash" >> ~/.bashrc