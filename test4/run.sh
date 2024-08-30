docker run -it \
  --privileged \
  --name ros2-c1 \
  -v /yourpath/workspaces/data:/workspace/data \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  osrf/ros:humble-desktop bash



mkdir -p /workspace/colcon_ws/src
git clone --recurse-submodules https://github.com/UZ-SLAMLab/ORB_SLAM3.git /workspace/ORB_SLAM3

cd /workspace/ORB_SLAM3/Thirdparty
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
git checkout tags/v0.8
mkdir build
cd build
cmake ..
make -j4

cd /workspace/ORB_SLAM3
sed -i 's/++11/++14/g' CMakeLists.txt
./build.sh


cd /workspace/colcon_ws/src
git clone https://github.com/zang09/ORB_SLAM3_ROS2.git
cd ORB_SLAM3_ROS2
git checkout humble
cd CMakeModules
sed -i 's|set(ORB_SLAM3_ROOT_DIR "~/Install/ORB_SLAM/ORB_SLAM3")|set(ORB_SLAM3_ROOT_DIR "/workspace/ORB_SLAM3")|' FindORB_SLAM3.cmake
cd /workspace/colcon_ws
source /opt/ros/humble/setup.bash
colcon build --symlink-install --packages-select orbslam3


./Examples/RGB-D/rgbd_tum \
./Vocabulary/ORBvoc.txt \
./Examples/RGB-D/TUM1.yaml \ 
../data/ASL/rgbd_dataset_freiburg1_xyz \
./Examples/RGB-D/associations/fr1_xyz.txt

