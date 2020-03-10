#!/bin/bash
echo "Startup script"

rospack find duckietown_msgs
if [ $? -ne 0 ]; then 
  echo "Need to build environment first ..."
  catkin build --workspace catkin_ws
fi
source catkin_ws/devel/setup.bash

echo "starting roscore"
roscore
if [ $? -ne 0 ]; then
  echo "Unable to start roscore, aborting ..."
  exit 1
fi

echo "starting ros bridge"
python2 solution2.py
if [ $? -ne 0 ]; then
  echo "Error while running ros bridge, aborting ..."
  exit 1
fi

echo "Executed python2 solution2.py"
#jupyter-notebook --allow-root --ip="*" --no-browser
