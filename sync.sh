#!/bin/bash

dir_list=$(ls -1)

for dir in $dir_list; do
    #statements
    rsync -vauP --exclude=$dir/.* $dir ~/GitHub/Vim/bundle/
done

