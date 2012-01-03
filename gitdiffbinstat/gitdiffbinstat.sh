#!/bin/bash


#    gitdiffbinstat - gets a git diff --shortstat-like output for changed binary files
#    Copyright (C) 2012  Matthias Krüger

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 1, or (at your option)
#    any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA  02110-1301 USA

obj=$1
git diff $obj --shortstat ./
diffstat=`git diff $obj --stat ./ | awk '/>/' `

old=`echo "${diffstat}" | awk '{ sum+=$4} END {print sum}'`

new=`echo "${diffstat}" | awk '{ sum+=$6} END {print sum}'`

files=`echo "${diffstat}" | wc -l`
echo -e " $files binary files changed, \e[033;31m$old\e[0m -> \e[033;32m$new\e[0m bytes"
