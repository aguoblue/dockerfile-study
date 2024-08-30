docker build -t glvnd-x:latest .


# Expose the X server on the host.
sudo xhost +local:root
# --rm: Make the container ephemeral (delete on exit).
# -it: Interactive TTY.
# --gpus all: Expose all GPUs to the container.
docker run \
  --rm \
  -it \
  --gpus all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  glvnd-x \
  bash

#Inside the container, a good way to test that the GPU is being used is to install and run the OpenGL benchmark application glmark2.
apt-get update \
  && apt-get install -y -qq glmark2 \
  && glmark2