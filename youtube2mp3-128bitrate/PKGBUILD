# Maintainer: Patryk Rzucidlo (@PTKDev) <ptkdev@gmail.com>

#youtube2mp3
#    Copyright (C) 2012  PTKDev <ptkdev@gmail.com> - http://www.ptkdev.it/
#    This Project is Fork Of youtube2mp3 (https://github.com/emres/youtube2mp3)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# SUPPORT:
# Follow on Twitter: @PTKDev
# IRC: chat.freenode.net at #ptkdev
# E-mail: ptkdev@gmail.com


pkgname=youtube2mp3-128bitrate
pkgver=20120317
pkgrel=6
pkgdesc="A very simple system to download YouTube music videos and convert them to mp3 files"
arch=('i686' 'x86_64')
url="https://github.com/PTKDev/youtube2mp3"
license=('GPL')
depends=('youtube-dl' 'zenity' 'lame' 'ffmpeg')
makedepends=('git')
provides=('youtube2mp3-128bitrate')
conflicts=('youtube2mp3-128bitrate')

_gitroot="git://github.com/PTKDev/youtube2mp3.git"
_gitname="youtube2mp3"
_gitbranch="master"

build() {
  cd "${srcdir}"
  
  if [ -d $_gitname ] ; then
    cd $_gitname && git checkout $_gitbranch && git pull
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname && cd $_gitname
  fi
  
  cd ./128/
  sh install.sh
}
 
package() {
  cd "${srcdir}/${_gitname}"
}
