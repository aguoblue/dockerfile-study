docker run -it --rm \
  --name orbslam3test-c2 \
  -v /yourpath/workspaces/data:/workspace/data \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --gpus all \
  orbslam3test-i2 bash

glxinfo | grep "OpenGL" # 软件加速，没有识别nvidia
  # --net=host --ipc=host --pid=host \

docker run \
  --rm \
  -it \
  --gpus all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e NVIDIA_DRIVER_CAPABILITIES=graphics,utility,compute \
  orbslam3test-i2  \
  bash

glxinfo | grep "OpenGL" #可识别 nvidia