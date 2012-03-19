# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw32-oglp
pkgver=20120319
pkgrel=1
pkgdesc="OpenGL wrapper for C++ (mingw32)"
license=('GPL')
arch=('i686' 'x86_64')
url="http://github.com/ekpyron/oglp/"
depends=('mingw32-runtime' 'mingw32-glmath')
makedepends=('mingw32-gcc')
_gitroot="git://github.com/ekpyron/oglp"
_gitname="oglp"
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
