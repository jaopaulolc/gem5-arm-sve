CC = aarch64-none-linux-gnu-gcc

CPPFLAGS = -Wall -I $(shell echo ${GEM5_PATH})/include
CFLAGS = -O3 -march=armv8.2-a+sve+sve2 \
				 --sysroot=$(shell echo ${CROSS_COMPILER_SYSROOT})
LDFLAGS = -static -L $(shell echo ${M5_LIB_PATH}) -lm5

all: hello-world.x

%.x: %.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CPPFLAGS) -c $(CFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	$(RM) *.x
