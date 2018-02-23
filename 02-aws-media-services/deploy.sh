#!/bin/bash

dir=`dirname $0` && cd $dir

# Media Package
make -f media-package/Makefile

export DST_1_URL=$(cat channelA | cut -f1)
export DST_1_USER=$(cat channelA | cut -f2)
export DST_1_PASS="channelA"

export DST_2_URL=$(cat channelB | cut -f1)
export DST_2_USER=$(cat channelB | cut -f2)
export DST_2_PASS="channelB"


# Media Live
make -f media-live/input-sg.Makefile
make -f media-live/input.Makefile

export INPUT_ID=$(cat input)
# export ROLE_ARN=""

make -f media-live/channel.Makefile

