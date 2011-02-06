# Contributor: Janusz Marat (mrvc) <mrvc@gazeta.pl>

pkgname=mms-bzr
pkgver=1611
pkgrel=1
arch=('i686')
license=(GPL)
pkgdesc="The My Media System - bzr version"
url="http://mymediasystem.org"
makedepends=('autoconf' 'bzr' 'gcc' 'imlib2' 'pkgconfig')
depends=('commoncpp2' 'inotify-tools' 'libxml2' 'lirc-utils' 'sdl' 'sqlite3' 'taglib' 'xine-lib')
source=()
md5sums=()
provides=('mms')
conflicts=('mms')

_bzrtrunk=http://bazaar.launchpad.net/~team-mms/mms/1.1.0
_bzrmod=mms-1.1.0

build() {
  cd $startdir/src

  msg "Connecting to the server...."

  if [ ! -d ./$_bzrmod ]; then 
        bzr co $_bzrtrunk $_bzrmod
  else
        bzr update $_bzrmod
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./$_bzrmod-build ] && rm -rf ./$_bzrmod-build
  cp -r ./$_bzrmod ./$_bzrmod-build
  cd ./$_bzrmod-build

        ./configure --prefix=/usr --enable-lirc --enable-game --disable-alsaplayer --enable-xine-audio --enable-opengl --enable-tv --enable-python --enable-weather --enable-clock --enable-mpeg --enable-notify-area --enable-vbox
	make || return 1
	mkdir -p $startdir/pkg 
	make DESTDIR=$startdir/pkg install
}

