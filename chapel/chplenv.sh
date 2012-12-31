# See /usr/share/doc/chapel/README.chplenv for envar details

export CHPL_HOME=/opt/chapel
export CHPL_HOST_PLATFORM=$($CHPL_HOME/util/chplenv/platform)
export PATH="$PATH":$CHPL_HOME/bin/$CHPL_HOST_PLATFORM

# export CHPL_TARGET_PLATFORM=$CHPL_HOST_PLATFORM
# export CHPL_TARGET_COMPILER=gnu
# export CHPL_HOST_COMPILER=gnu
# export CHPL_MAKE=make
# export CHPL_TASKS=fifo
# export CHPL_THREADS=pthreads
# export CHPL_COMM=
# export CHPL_MEM=default
# export CHPL_LAUNCHER=
# export CHPL_TIMERS=generic
# export CHPL_GMP=
# export CHPL_LLVM=
