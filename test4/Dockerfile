# 使用 osrf/ros:humble-desktop 作为基础镜像
FROM osrf/ros:humble-desktop

# 设置非交互模式以避免在构建过程中出现交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表并安装必要的软件包
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential \
    cmake \
    git \
    libeigen3-dev \
    libopencv-dev \
    python3 \
    python3-pip \
    mesa-utils \
    libgl1-mesa-glx \
    x11-apps \
    xorg \
    libglu1-mesa-dev \
    freeglut3-dev \
    mesa-common-dev \
    libglew-dev \
    libboost-all-dev \
    libssl-dev \
    software-properties-common \
    curl && \
    apt-get clean

# 创建非 root 用户 admin
RUN useradd -m admin && echo "admin:password" | chpasswd && adduser admin sudo

# 克隆和构建 ORB_SLAM3 和 Pangolin
RUN mkdir -p /workspace && \
    git clone --recurse-submodules https://github.com/UZ-SLAMLab/ORB_SLAM3.git /workspace/ORB_SLAM3 && \
    cd /workspace/ORB_SLAM3/Thirdparty && \
    git clone https://github.com/stevenlovegrove/Pangolin.git && \
    cd Pangolin && \
    git checkout tags/v0.6 && \
    mkdir build && cd build && \
    cmake .. && \
    make -j4 && \
    cd /workspace/ORB_SLAM3 && \
    ./build.sh

# 克隆并构建 ORB_SLAM3 的 ROS 2 包
RUN cd /workspace && \
    mkdir -p /workspace/colcon_ws/src && \
    cd /workspace/colcon_ws/src && \
    git clone https://github.com/zang09/ORB_SLAM3_ROS2.git && \
    cd ORB_SLAM3_ROS2 && \
    git checkout humble && \
    apt-get install -y ros-humble-vision-opencv ros-humble-message-filters python3-colcon-common-extensions && \
    apt-get clean

# 添加 ROS 2 环境变量到 ~/.bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> /home/admin/.bashrc
RUN chown admin:admin /home/admin/.bashrc

# 设置工作目录
WORKDIR /workspace

# 切换到非 root 用户
USER admin

# 设置容器的默认命令
CMD ["bash"]
