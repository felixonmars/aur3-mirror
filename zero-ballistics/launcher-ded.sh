#!/bin/bash
cd '/opt/zero-ballistics/'

LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:./shared_libs" ./server_ded.x86
