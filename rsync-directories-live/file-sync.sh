#!/bin/bash

while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete <path/to/the/source/directory>
  rsync -avz  <path/to/the/source/directory> <path/to/the/sync>	
done

