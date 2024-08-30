# 使用 NVIDIA 的 CUDA 基础镜像，支持 GPU
FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

# 设置非交互模式以避免在构建过程中出现交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表并安装必要的软件包
RUN apt-get update && apt-get install -y \
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
    && apt-get clean

# 设置工作目录
WORKDIR /workspace

# 复制你的项目文件到工作目录（如果有的话）
# COPY . /workspace

# 设置容器的默认命令
CMD ["bash"]
