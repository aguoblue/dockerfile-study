docker build -t glvnd-x:nvcc-ubuntu2204 .

docker run \
  -it \
  --name vins-f \
  --gpus all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /yourpath/workspaces/data:/root/data \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  glvnd-x:nvcc-ubuntu2204  \
  bash

#Inside the container, a good way to test that the GPU is being used is to install and run the OpenGL benchmark application glmark2.
apt-get update \
  && apt-get install -y -qq glmark2 \
  && glmark2

glxinfo | grep "OpenGL"


apt-get install git


# ------ros2--------
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

source /opt/ros/humble/setup.bash
# ------ros--------


# ------vins-fusion-------


#------ceres-solver-------
git clone --recursive https://ceres-solver.googlesource.com/ceres-solver
apt-get install libgoogle-glog-dev libgflags-dev
apt-get install libatlas-base-dev
apt-get install libeigen3-dev
apt-get install libsuitesparse-dev
cd ceres-solver
git checkout 2.1.0
mkdir build
cd build
cmake ..
make -j4
#------ceres-solver-------

# ------vins-fusion-------