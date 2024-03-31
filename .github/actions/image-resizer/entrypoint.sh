#!/bin/sh

set -e

# Directory where the original images are stored
SOURCE_DIR=$1
# Desired size of the images
SIZE=$2
# Subfolder name, based on the desired size
SUBFOLDER_NAME=$3

# Create the subfolder in each directory containing images
find $SOURCE_DIR -type d | while read dir; do
  mkdir -p "${dir}/${SUBFOLDER_NAME}"
done

# Find and resize images, then save them in the corresponding subfolder
find $SOURCE_DIR -iname "*.png" -o -iname "*.jpg" | while read img; do
  DIR=$(dirname "${img}")
  BASENAME=$(basename "${img}")
  convert "$img" -resize $SIZE "${DIR}/${SUBFOLDER_NAME}/${BASENAME}"
done