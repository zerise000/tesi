CC=gcc
CFLAGS=-Wall -Wextra -Wpedantic -g
C_DEST_FILES := ./out/libmem.o ./out/libcpu.o 

compile: $(C_DEST_FILES) 
	@ if [ ! -d ./out ]; then mkdir out; fi
	@ $(CC) $(C_DEST_FILES) $(CFLAGS) -o main ./src/main.c

./out/libcpu.o: ./src/c_files/libcpu.c
	@ $(CC) -c $^ -o $@

./out/libmem.o: ./src/c_files/libmem.c
	@ $(CC) -c $^ -o $@
clean:
	@ rm -rf ./out/
