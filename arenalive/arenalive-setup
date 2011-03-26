#!/bin/bash

arenalive_dir=$HOME/.arenalive

[ ! -d $arenalive_dir ] && {
    echo ">> Setting up ArenaLive..."
    install -d $arenalive_dir/baseoa
    ln -s  /usr/share/arenalive/arenalive-linux  $arenalive_dir/
    ln -s  /usr/share/arenalive/lib*.so.*        $arenalive_dir/
    ln -s  /usr/share/arenalive/baseoa/*         $arenalive_dir/baseoa/
    echo ">> done"
} || {
    echo ">> ArenaLive already set up."
}
