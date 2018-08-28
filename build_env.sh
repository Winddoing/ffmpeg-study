##########################################################
# File Name		: evn_build.sh
# Author		: wqshao
# Created Time	: 2018年08月28日 星期二 15时19分22秒
# Description	:
##########################################################
#!/bin/bash

PWD=`pwd`
build_dir="ffmpeg"
ffmpeg_version="n4.0.2"
build_out="out"


function local_env_prepare()
{
	sudo apt-get install -y  nasm
}

function ffmpeg_prepare()
{

	if [ ! -d $build_dir ]; then
		mkdir $build_dir
	fi
	echo "Download FFmpeg ..."

	#wget -P $build_dir https://github.com/FFmpeg/FFmpeg/archive/${ffmpeg_version}.tar.gz

	tar zxvf $build_dir/${ffmpeg_version}.tar.gz -C $build_dir
}

function ffmpeg_build()
{
	cd ./${build_dir}/FFmpeg-${ffmpeg_version}
	echo "Currect dir $PWD"

	if [ -d ${PWD}/${build_dir}/${build_out} ]; then
		return 4
	fi

    ./configure --enable-shared  --prefix=${PWD}/${build_dir}/${build_out}
	make
	make install

	cd -
}

# main

#local_env_prepare

ffmpeg_prepare

ffmpeg_build
if [ $? == 4 ]; then
	echo "Already built exit !!!"
	exit 1
fi
