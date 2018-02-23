#!/bin/bash

dir=`dirname $0` && cd $dir

# Media Live
make -f media-live/channel.Makefile clean
make -f media-live/input.Makefile clean
make -f media-live/input-sg.Makefile clean


# Media Package
make -f media-package/Makefile clean


