#!/bin/bash

# This script renames files by inserting a suffix before their extension

# print usage
print_usage() {
  echo "Usage: $0 [-d] [-v] [-h] [--] sfx files..."
  echo "  -h       print help message"
  echo "  -d       dry run, print old and new file names without actual renaming"
  echo "  -v       print old and new names of renamed files"
  echo "  --       option and suffix/file names separator"
  echo "  sfx      the suffix to be inserted before the file's extension"
  echo "  files    the list of files to be renamed"
}

# parse options and arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h)
      print_usage
      exit
      ;;
    -d)
      dry_run=true
      shift
      ;;
    -v)
      verbose=true
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done

# check if the suffix is provided
if [[ -z $1 ]]; then
  >&2 echo "Error: suffix not provided"
  print_usage
  exit 1
fi

# check if the list of files is provided
if [[ $# -lt 2 ]]; then
  >&2 echo "Error: file list not provided"
  print_usage
  exit 1
fi

# store the suffix and shift the arguments
sfx=$1
shift

# loop through the provided files
for file in "$@"; do
  # get the file name and extension
  filename=$(basename "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"

  # insert the suffix before the extension
  new_filename="${filename}${sfx}.${extension}"

  # print the old and new file names if verbose mode is enabled
  if [[ $verbose = true ]]; then
    echo "$filename.$extension -> $new_filename"
  fi

  # skip renaming if dry run mode is enabled
  if [[ $dry_run = true ]]; then
    continue
  fi

  # rename the file
  mv "$file" "$new_filename"

  # check if renaming was successful
  if [[ $? -ne 0 ]]; then
    >&2 echo "Error: failed to rename file $file"
  fi
done

