docker run -it \
  --name ros2-orb \
  --gpus all \
  -v /yourpath/workspaces/data:/root/data \
  -v /yourpath/workspaces/ORB_SLAM3:/root/ORB_SLAM3 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  osrf/ros:humble-desktop bash


  