docker run -it \
  --name ros1-noetic \
  --gpus all \
  --privileged \
	--device=/dev/video0 \
	--device=/dev/video1 \
	--device=/dev/video2 \
	--device=/dev/video3 \
	--device=/dev/video4 \
	--device=/dev/video5 \
	--device=/dev/media0 \
	--device=/dev/media1 \
  -v /yourpath/workspaces/data:/root/data \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  osrf/ros:noetic-desktop-full bash

apt-get update
apt-get install curl -y
mkdir -p /etc/apt/keyrings
curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | tee /etc/apt/keyrings/librealsense.pgp > /dev/null


echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo `lsb_release -cs` main" | \
tee /etc/apt/sources.list.d/librealsense.list
apt-get update

apt-get install librealsense2-dkms -y
apt-get install librealsense2-utils -y

apt-get install librealsense2-dev -y
apt-get install librealsense2-dbg -y

modinfo uvcvideo | grep "version:"