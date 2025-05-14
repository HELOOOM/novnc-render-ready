#!/bin/bash
echo "Starting noVNC server..."
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 8080
