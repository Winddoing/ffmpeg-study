CC=gcc
CFLAGS=-g -I$(FFMPEG)/include
LDFLAGS = -L$(FFMPEG)/lib/ -lswscale -lswresample -lavformat -lavdevice -lavcodec -lavutil -lavfilter  -lm 
TARGETS=test
all: $(TARGETS)
	@echo $(FFMPEG)
	test:test.c
	   $(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) -std=c++11 #注意这里的-std=c++11
		 
clean:
	    rm -rf $(TARGETS)

