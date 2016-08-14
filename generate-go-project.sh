#!/bin/bash
# Run this script within .../project52

set -e
PROJECT_NAME=$1

if [ -z "${PROJECT_NAME}" ]
  then
  PROJECT_NAME="default"
fi

mkdir ~/workspace/"${PROJECT_NAME}"
