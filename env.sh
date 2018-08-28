##########################################################
# File Name		: env.sh
# Author		: wqshao
# Created Time	: 2018年08月28日 星期二 20时13分04秒
# Description	:
##########################################################
#!/bin/bash

PWD=`pwd`
build_dir="ffmpeg"
ffmpeg_version="n4.0.2"
build_out="out"

FFMPEG=${PWD}/${build_dir}/${build_out}

export FFMPEG
