CXX = g++
CFLAGS =-g -I$(FFMPEG)/include
LDFLAGS = -L$(FFMPEG)/lib/ -lswscale -lswresample -lavformat -lavdevice -lavcodec -lavutil -lavfilter  -lm
SRCS = test.cpp
TARGETS = test.out

$(TARGETS):$(SRCS)
	$(CXX) $(CFLAGS) -o $@ $^ $(LDFLAGS)

all: $(TARGETS)

clean:
	    rm -rf $(TARGETS)

