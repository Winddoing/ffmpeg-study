#include <stdio.h>
#include "libavformat/avformat.h"
#include "libswscale/swscale.h"
#include "libavfilter/avfilter.h"

#define dbmsgc(fmt, args ...) printf("cong:%s[%d]: "fmt"\n", __FUNCTION__, __LINE__,##args)
//#define dbmsg(fmt, args ...) printf("cong:%s:%s[%d]: "fmt"\n",__FILE__, __FUNCTION__, __LINE__,##args)
int main(int argc, char **argv)
{
	int i=0;
	AVFormatContext *pFormatCtx = NULL;
	avcodec_register_all();
#if CONFIG_AVDEVICE
	avdevice_register_all();
#endif
	avfilter_register_all();
	av_register_all();

	if(avformat_open_input(&pFormatCtx, argv[1], NULL, NULL)!=0)
		return -1; // Couldn't open file

	if(avformat_find_stream_info(pFormatCtx, NULL)<0)
		return -1; // Couldn't find stream inform
	av_dump_format(pFormatCtx,0, 0, 0);

	return 0;
}
