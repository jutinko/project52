#!/bin/bash
set -e
# Run this script within .../project52

create_license() {
  year=$(date "+%Y")
  project_dir=$1
  echo "The MIT License (MIT)

  Copyright (c) ${year} Zhou Yu

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the \"Software\"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE." > "${project_dir}/LICENSE"
}

create_readme_skeleton() {
  project_name=$1
  project_dir=$2

  echo "# ${project_name}
[![Build Status](https://travis-ci.org/jutkko/${project_name}.svg?branch=master)](https://travis-ci.org/jutkko/${project_name})

# Benchmark

# Reference

# Project52
This is a project from my [Project52](https://github.com/jutkko/project52)." > "${project_dir}/README.md"
}

PROJECT_NAME=$1
if [ -z "${PROJECT_NAME}" ]
  then
  PROJECT_NAME="default"
fi

PROJECT_DIR="$HOME/workspace/${PROJECT_NAME}"
mkdir "${PROJECT_DIR}"

pushd "${PROJECT_DIR}" 1>/dev/null
git init 1>/dev/null

create_license "${PROJECT_DIR}"
create_readme_skeleton "${PROJECT_NAME}" "${PROJECT_DIR}"
popd 1>/dev/null

echo "Now you can add your git remote to ${PROJECT_DIR} dir"
