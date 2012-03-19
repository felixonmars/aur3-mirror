# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw32-oglimg
pkgver=20120319
pkgrel=1
pkgdesc="OpenGL image loading library for C++ (mingw32)"
license=('GPL')
arch=('i686' 'x86_64')
url="http://github.com/ekpyron/oglimg/"
depends=('mingw32-runtime' 'mingw32-glmath' 'mingw32-oglp')
makedepends=('mingw32-gcc')
_gitroot="git://github.com/ekpyron/oglimg"
_gitname="oglimg"
options=(!strip !buildflags)

mingw32=i486-mingw32

build() {
  # mingw32 has problems with --hash-style=gnu (default value)
  unset LDFLAGS
  
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
  
  ../configure --prefix=/usr/${mingw32} --host=${mingw32}
  make
}

package() {
  cd "${srcdir}/$_gitname/build"
  make install DESTDIR="${pkgdir}"
}
