# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=oglimg
pkgver=20120427
pkgrel=1
pkgdesc="OpenGL image loading library for C++"
license=('GPL')
arch=('i686' 'x86_64')
url="http://github.com/ekpyron/oglimg/"
depends=('glm' 'oglp')
makedepends=('gcc')
_gitroot="git://github.com/ekpyron/oglimg"
_gitname="oglimg"

build() {
  
  cd "$srcdir"
  
  msg 'Connecting to GIT server...'
  
  if [ -d ${_gitname} ]; then
  	cd ${_gitname} && git pull origin
  	cd ..
  else
  	git clone ${_gitroot}
  fi
  
  msg 'GIT checkout done or server timeout.'

  cd "${srcdir}/$_gitname"
  ./autogen.sh
  
  rm -rf build
  mkdir build
  cd build
  
  ../configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$_gitname/build"
  make install DESTDIR="${pkgdir}"
}
