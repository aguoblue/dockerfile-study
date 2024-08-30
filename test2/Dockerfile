# 使用 NVIDIA 的 CUDA 基础镜像，支持 GPU
FROM nvidia/cuda:12.5.1-runtime-ubuntu22.04

# 设置非交互模式以避免在构建过程中出现交互式提示
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

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
    locales \
    software-properties-common \
    curl && \
    apt-get clean && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

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

# 添加 ROS 2 源并安装 ROS 2
RUN add-apt-repository universe && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y ros-humble-desktop && \
    apt-get clean

# 克隆并构建 ORB_SLAM3 的 ROS 2 包
RUN cd /workspace && \
    mkdir -p /workspace/colcon_ws/src && \
    cd /workspace/colcon_ws/src && \
    git clone https://github.com/zang09/ORB_SLAM3_ROS2.git && \
    cd ORB_SLAM3_ROS2 && \
    git checkout humble && \
    apt install ros-humble-vision-opencv && \
    apt install ros-humble-message-filters && \
    apt install -y python3-colcon-common-extensions && \
    apt-get clean

# 设置工作目录
WORKDIR /workspace

# 设置容器的默认命令
CMD ["bash"]
