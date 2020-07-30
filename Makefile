
CC=gcc
CFLAGS=-shared -fPIC

TARGET=cdll
C_PATH=./C_src
SO_PATH=./lib

$(SO_PATH)/$(TARGET).so:	$(C_PATH)/$(TARGET).c
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf *~
