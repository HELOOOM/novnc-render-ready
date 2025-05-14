#!/bin/bash
echo "Starting noVNC server..."
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 8080
