docker run -it \
  --name ros2-rtab \
  --gpus all \
  -v /yourpath/workspaces/data:/workspace/data \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  osrf/ros:humble-desktop bash


mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
git clone https://github.com/introlab/rtabmap.git src/rtabmap
git clone --branch ros2 https://github.com/introlab/rtabmap_ros.git src/rtabmap_ros
rosdep update && rosdep install --from-paths src --ignore-src -r -y
source /opt/ros/humble/setup.bash 
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
apt-get install ros-humble-image-pipeline
apt-get install ros-humble-imu-tools