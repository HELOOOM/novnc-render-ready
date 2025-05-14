#!/bin/bash
echo "Starting noVNC server..."
novnc_proxy --vnc localhost:5901 --listen 8080
