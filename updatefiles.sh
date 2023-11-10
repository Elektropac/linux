#!/bin/bash

# Define the Git repository URL and the branch
repo_url="https://github.com/elektropac/linux"
branch="main"

# Define the directory where you want to save the latest file
destination_dir="/home/ubuntu"

# Clone the repository (if not already cloned)
if [ ! -d "$destination_dir" ]; then
  git clone --branch $branch --single-branch $repo_url $destination_dir
else
  # Pull the latest changes
  cd $destination_dir
  git pull
fi

# List files in the destination directory and find the latest one
latest_file=$(ls -t $destination_dir | head -n1)

# Do something with the latest file (e.g., display it)
echo "The latest file is: $latest_file"
