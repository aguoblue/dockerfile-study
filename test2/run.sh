docker run -it \
  --privileged \
  --net=host --ipc=host --pid=host \
  --name orbslam3test-c \
  -v /yourpath/workspaces/data:/workspace/data \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device /dev/dri \
  --gpus all \
  --runtime=nvidia \
  orbslam3test-i bash
#-----------------------------
# -v 绑定一个数据卷而不是本地路径？
/workspace 
    /ORB_SLAM3
    /ros2_ws


#-----------------------------
./build.sh
cd Thirdparty
apt-get install libssl-dev
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
git checkout tags/v0.6
mkdir build && cd build
cmake ..
make -j4

#----------------------------------
locale  # check for UTF-8
apt update && apt install locales
locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings

apt install software-properties-common
add-apt-repository universe

apt update && apt install curl -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

apt update
apt upgrade

apt install ros-humble-desktop

#--------------------------------------------
cd /workspace/ORB_SLAM3/Examples
https://github.com/zang09/ORB_SLAM3_ROS2.git
cd ORB_SLAM3_ROS2
git checkout humble


apt install ros-humble-vision-opencv
apt install ros-humble-message-filters

apt install -y python3-colcon-common-extensions