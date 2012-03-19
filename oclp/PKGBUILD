# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=oclp
pkgver=20120319
pkgrel=1
pkgdesc="OpenCL wrapper library for C++"
license=('GPL')
arch=('i686' 'x86_64')
url="http://github.com/ekpyron/oclp/"
depends=('opencl-headers' 'oglp')
makedepends=('gcc')
_gitroot="git://github.com/ekpyron/oclp"
_gitname="oclp"

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
