#!/usr/bin/env bash

# Author: Richard Loveless III (rlovelessiii)
# Description: Check path and create directories

# @Params: $1 = full path to directory to check
DIR_PATH=${1}

IFS='/' read -r -a DIRS <<< $1
DIR_PATH=""
for DIR in "${DIRS[@]}"; do
    if ! [[ ${DIR} ]]; then continue; fi
    if [[ ${DIR} == "\$HOME" ]]; then 
        DIR_PATH=${HOME}
        continue
    fi
    DIR_PATH=${DIR_PATH}/${DIR}
    echo ${DIR_PATH}
    if ! [[ -d ${DIR_PATH} ]]; then
        echo "Creating directory ${DIR_PATH}"
        #mkdir ${DIR_PATH}
    fi
done
    
unset DIRS DIR_PATH
