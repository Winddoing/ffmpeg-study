##########################################################
# File Name		: evn_build.sh
# Author		: wqshao
# Created Time	: 2018年08月28日 星期二 15时19分22秒
# Description	:
##########################################################
#!/bin/bash

PWD=`pwd`
build_dir="ffmpeg"
ffmpeg_version="n3.4.4"
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

	if [ -f ${PWD}/${build_dir}/${ffmpeg_version}.tar.gz ]; then
		return 3
	fi

	wget -P $build_dir https://github.com/FFmpeg/FFmpeg/archive/${ffmpeg_version}.tar.gz

	tar zxvf $build_dir/${ffmpeg_version}.tar.gz -C $build_dir
}

function ffmpeg_build()
{
	local root_pwd=$PWD
	cd ./${build_dir}/FFmpeg-${ffmpeg_version}
	echo "Currect dir $PWD"

	if [ -d ${root_pwd}/${build_dir}/${build_out} ]; then
		return 4
	fi

	./configure --enable-shared  --prefix=${root_pwd}/${build_dir}/${build_out}
	echo "./configure --enable-shared  --prefix=${root_pwd}/${build_dir}/${build_out}"
	make
	make install

	cd -
}

# main

#local_env_prepare

ffmpeg_prepare
if [ $? == 3 ]; then
	echo "FFmpeg Installation package [${ffmpeg_version}.tar.gz] already exists"
	exit 1
fi

ffmpeg_build
if [ $? == 4 ]; then
	echo "Already built exit !!!"
	exit 1
fi
