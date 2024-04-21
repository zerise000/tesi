CC=gcc
CXX=g++
CFLAGS=-Wall -Wextra -Wpedantic -g
C_DEST_FILES := ./out/libmem.o ./out/libcpu.o 

compile: $(C_DEST_FILES) 
	@ if [ ! -d ./out ]; then mkdir out; fi
	@ $(CXX) $(C_DEST_FILES) $(CFLAGS) -o main ./src/main.cpp

./out/libcpu.o: ./src/cpp_files/libcpu.cpp
	@ $(CXX) -c $^ -o $@

./out/libmem.o: ./src/cpp_files/libmem.cpp
	@ $(CXX) -c $^ -o $@
clean:
	@ rm -rf ./out/
