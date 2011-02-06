# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=logstalgia-git
pkgver=20100605
pkgrel=1
pkgdesc="Apache-compatible logs visualizer"
arch=('i686' 'x86_64')
url="http://logstalgia.googlecode.com"
license=('GPL')
depends=('sdl' 'libpng' 'libjpeg' 'sdl_image' 'ftgl' 'pcre')
makedepends=()
optdepends=()
provides=('logstalgia')

_gitroot="http://github.com/acaudwell/Logstalgia.git"
_gitname="Logstalgia"

build() {
msg "Git checkout"
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname 
  git pull origin master || return 1
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi
msg2 "Git checkout done or server timeout"
msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

msg "Building and installing..."  
  autoreconf -vfi
  ./configure
  make
  make DESTDIR=${pkgdir} install

msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_gitname}-build
}
# vim:syntax=sh
