/*#############################################################
 *     File Name	: test.cpp
 *     Author		: wqshao
 *     Created Time	: 2018年08月29日 星期三 10时05分08秒
 *     Description	:
 *############################################################*/
#include <iostream>
using namespace std;

#define __STDC_CONSTANT_MACROS  

extern "C" {
#include "libavcodec/avcodec.h"
#include "libavformat/avformat.h"
#include "libavutil/avutil.h" 
}

int main(int argc, char *argv[])
{
	cout << "FFmpeg Test!" << endl;

	av_register_all();

	cout << "FFmpeg version:" << avcodec_version() << endl;

	return 0;
}

