#!/bin/bash

# variables for the installation
export pkg_dir=/home/ubuntu/ros2_ws

# Update the package list
apt-get update
apt-get upgrade -y

# Clone the repository with simulator
git clone -b humble https://github.com/jmguerreroh/tiago_simulator.git $pkg_dir/src/tiago_simulator

# Change directory to the cloned repository
cd $pkg_dir/src 

# import thirdparty repos
vcs import < tiago_simulator/thirdparty.repos

rm -rf $pkg_dir/src/ThirdParty/aws-robomaker-hospital-world
cd $pkg_dir 
rosdep install --from-paths src --ignore-src -r -y

# Compile the code
colcon build --symlink-install

# Run any additional commands or scripts as needed
echo "source $pkg_dir/install/setup.bash" >> /home/ubuntu/.bashrc