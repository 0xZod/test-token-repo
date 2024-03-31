#!/bin/sh

set -e

# Directory where the original images are stored
SOURCE_DIR=$1
# Desired size of the images
SIZE=$2
# Subfolder name, based on the desired size
SUBFOLDER_NAME=$3

# Create the subfolder in each directory containing images
find "$SOURCE_DIR" -type d | while read -r dir; do
  mkdir -p "${dir}/${SUBFOLDER_NAME}"
done

# Find and resize PNG images, then save them in the corresponding subfolder
find "$SOURCE_DIR" -maxdepth 1 -iname "*.png" | while read -r img; do
  DIR=$(dirname "${img}")
  BASENAME=$(basename "${img}")
  TARGET="${DIR}/${SUBFOLDER_NAME}/${BASENAME}"
  
  # Check if the resized image already exists
  if [ ! -f "$TARGET" ]; then
    convert "$img" -resize "$SIZE" "$TARGET"
  else
    echo "Resized image already exists: $TARGET"
  fi
done