#!/bin/sh
./configure --prefix=/usr || return 1
make || return 1
