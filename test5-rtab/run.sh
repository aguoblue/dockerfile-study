docker run -it --rm \
  --privileged \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --env="XAUTHORITY=$XAUTH" \
  --volume="$XAUTH:$XAUTH" \
  --gpus all \
  --network host \
  -v ~/Documents/RTAB-Map:/root/Documents/RTAB-Map \
  introlab3it/rtabmap:jammy \
  rtabmap



# 前置设置部分保持不变
export XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# 调整后的 Docker 运行命令
docker run -it --rm \
  --privileged \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --env="XAUTHORITY=$XAUTH" \
  --volume="$XAUTH:$XAUTH" \
  --gpus all \
  --network host \
  -v /yourpath/workspaces/rtabmap:/root/rtabmap \
  introlab3it/rtabmap:jammy \
  rtabmap


docker run -it --rm   --privileged   --env="DISPLAY=$DISPLAY"   --env="QT_X11_NO_MITSHM=1"   --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"   --env="XAUTHORITY=$XAUTH"   --volume="$XAUTH:$XAUTH"   --gpus all   --network host   -v /yourpath/workspaces/rtabmap:/root/rtabmap   introlab3it/rtabmap:jammy  rtabmap
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
[ WARN] (2024-07-25 14:31:45.933) Parameters.cpp:1266::readINIImpl() Section "Core" in /root/.rtabmap/rtabmap.ini doesn't exist... Ignore this warning if the ini file does not exist yet. The ini file will be automatically created when rtabmap will close.
Program started...
failed to create drawabl