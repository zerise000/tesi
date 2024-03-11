CC=gcc
C_HEADER_FILES=./src/c_files/libcpu.c
C_DEST_FILES=./out/libcpu.o

compile: $(C_DEST_FILES) $(C_HEADER_FILES) 
	@ $(CC) $(C_DEST_FILES) -o main ./src/main.c

$(C_DEST_FILES): $(C_HEADER_FILES)
	@ $(CC) -c $(C_HEADER_FILES) -o $(C_DEST_FILES)

clean:
	@ rm ./out/*
