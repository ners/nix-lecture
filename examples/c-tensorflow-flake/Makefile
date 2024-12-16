build: hello

hello: hello.c
	$(CC) $(CFLAGS) -ltensorflow -o hello hello.c

BINDIR ?= $(out)/bin
install: hello
	install -D --mode=755 hello ${BINDIR}/hello
