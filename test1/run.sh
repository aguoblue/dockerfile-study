docker build -t slam14-ubuntu22-gpu .


docker run -it --rm \
  --privileged \
  --network=host \
  --name slam14-container \
  -v /yourpath/workspaces/slambook2:/workspace \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device /dev/dri \
  --gpus all \
  --runtime=nvidia \
  slam14-ubuntu22-gpu bash


docker run -it --rm \
  --privileged \
  --network=host \
  --name slam14-container \
  -v /media/lhq/extData/workspaces:/workspace \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device /dev/dri \
  --gpus all \
  --runtime=nvidia \
  ubuntu22-gpu bash

#----------------------------------------------
还缺少依赖，慢慢来
  glxinfo | grep "OpenGL"
OpenGL vendor string: Mesa
OpenGL renderer string: llvmpipe (LLVM 15.0.7, 256 bits)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 23.2.1-1ubuntu3.1~22.04.2
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 23.2.1-1ubuntu3.1~22.04.2
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 23.2.1-1ubuntu3.1~22.04.2
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
