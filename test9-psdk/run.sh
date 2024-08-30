docker run -it -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "/yourpath/workspaces/data:/data" kalibr bash



rosbags-convert <ros2_bag_folder> --dst calib_01.bag --exclude-topic <non_img_and_imu_topics>



docker run -it -e "DISPLAY" -e "QT_X11_NO_MITSHM=1"     -v "/tmp/.X11-unix:/tmp/.X11-unix:rw"     -v "/yourpath/workspaces/data:/data" kalibr_20 bash





apt-get install libgoogle-glog-dev
# 下载1.14 ceres-solver
mkdir ~/ceres-solver
tar -xvzf ceres-solver.tar.gz -C  ~/ceres-solver
cd ~/ceres-solver
mkdir build
cd build
cmake ..
make -j4
make install


mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src

git clone https://github.com/gaowenliang/code_utils.git

#-----------------------------------
#CMakeLists.txt
#set(CMAKE_CXX_STANDARD 14)
#mat_io_test.cpp
#CV_LOAD_IMAGE_UNCHANGED 替换为 IMREAD_UNCHANGED

#sumpixel_test.cpp
#CV_MINMAX 替换为 NORM_MINMAX
#加上头文件
#include"opencv2/imgcodecs/legacy/constants_c.h"
#include "backward.hpp" 改为 #include "code_utils/backward.hpp"
#------------------------------------
apt-get install libdw-dev

cd ~/catkin_ws
catkin build

cd ~/catkin_ws/src
git clone https://github.com/gaowenliang/imu_utils.git

cd ~/catkin_ws
catkin build

cd ~/catkin_ws/src/imu_utils/launch/
touch dji.launch
# 修改 dji.launch
# 如下：
# <launch>
#     <node pkg="imu_utils" type="imu_an" name="imu_an" output="screen">
#         <param name="imu_topic" type="string" value= "/imu"/>    
#         <param name="imu_name" type="string" value= "dji_8_1_imu"/>           
#         <param name="data_save_path" type="string" value= "$(find imu_utils)/data/"/>
#         <param name="max_time_min" type="int" value= "61"/>  
#         <param name="max_cluster" type="int" value= "100"/>
#     </node>
# </launch>

cd ~/catkin_ws/
source ./devel/setup.bash
roslaunch imu_utils dji.launch 

# 另一个窗口播放
rosbag play -r 100 /root/data/bag/7-31djistatic.bag




#准备 /root/data/bag/7-31dji.bag
#准备 /root/data/april_6x6.yaml

cd /catkin_ws
source ./devel/setup.bash
rosrun kalibr kalibr_calibrate_cameras --bag /root/data/bag/7-31dji.bag --target /root/data/april_6x6.yaml --models pinhole-radtan pinhole-radtan --topics /wrapper/psdk_ros2/perception_stereo_left_stream /wrapper/psdk_ros2/perception_stereo_right_stream
#生成的文件在bag文件同级目录下


#准备 /root/data/bag/7-31dji.bag
#准备 /root/data/april_6x6.yaml
#准备 /root/data/imu.yaml 
rosrun kalibr kalibr_calibrate_imu_camera --target /root/data/april_6x6.yaml  --imu /root/data/imu.yaml  --cam /root/data/cam_file/7-31dji-camchain.yaml  --bag /root/data/bag/7-31dji.bag 
#生成的文件在bag文件同级目录下