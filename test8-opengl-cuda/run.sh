docker build -t glvnd-x:cuda-ubuntu2204 .


# Expose the X server on the host.
sudo xhost +local:root
# --rm: Make the container ephemeral (delete on exit).
# -it: Interactive TTY.
# --gpus all: Expose all GPUs to the container.
docker run \
  -it \
  --name slambook2 \
  --gpus all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /yourpath/workspaces/slambook2:/root/slambook2 \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  glvnd-x:cuda-ubuntu2204  \
  bash

  # --rm \

#Inside the container, a good way to test that the GPU is being used is to install and run the OpenGL benchmark application glmark2.
apt-get update \
  && apt-get install -y -qq glmark2 \
  && glmark2


apt-get update \
  && apt-get install -y -qq cmake g++ libeigen3-dev

  
cd /root/slambook2/3rdparty/Pangolin
git checkout tags/v0.8