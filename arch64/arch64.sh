#!/bin/bash

xhost +local:
schroot -c arch64 $*
