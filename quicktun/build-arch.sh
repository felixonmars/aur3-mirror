#!/bin/sh
mkdir -p obj out

export CPATH=/usr/include/nacl

gcc -c -DCOMBINED_BINARY	src/proto.raw.c		-o obj/proto.raw.o
gcc -c -DCOMBINED_BINARY	src/crypto_scalarmult_curve25519.c	-o obj/crypto_scalarmult_curve25519.o 
gcc -c -DCOMBINED_BINARY	src/proto.nacl0.c	-o obj/proto.nacl0.o
gcc -c -DCOMBINED_BINARY	src/proto.nacltai.c	-o obj/proto.nacltai.o
gcc -c -DCOMBINED_BINARY	src/run.combined.c	-o obj/run.combined.o
gcc -c 				src/common.c		-o obj/common.o
gcc -o out/quicktun.combined obj/common.o obj/run.combined.o obj/proto.raw.o obj/proto.nacl0.o obj/proto.nacltai.o obj/crypto_scalarmult_curve25519.o -lnacl

gcc -o out/quicktun.keypair	src/keypair.c		-lnacl
