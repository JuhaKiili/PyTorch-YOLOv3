#!/bin/bash

images_dir=$1
labels_dir=$2

find "$images_dir" -name "*.jpg" -exec realpath --relative-to "$images_dir" {} \; | while read -r i; do
  ls "$labels_dir/${i//jpg/txt}" > /dev/null || echo "not found label for image $i"
done
