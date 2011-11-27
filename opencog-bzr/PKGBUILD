# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=opencog-bzr
pkgver=6105
pkgrel=1
pkgdesc='OpenCog aims to provide research scientists and software developers with a common platform to build and share artificial intelligence programs.'
arch=('i686' 'x86_64')
url='http://www.opencog.org/'
license=('AGPL3')
options=('!makeflags')
depends=('boost-libs' 'unixodbc' 'xmlrpc-c' 'guile' 'gsl' 'xerces-c-2' 'sdl_gfx' 'expat' 'zeromq' 'protobuf' 'python2')
makedepends=('boost' 'bzr' 'cmake' 'luabind' 'cxxtest' 'doxygen' 'cython')

_bzrtrunk='lp:opencog'
_bzrmod='opencog'

build() {
  msg 'Connecting to the server...'
  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi
  msg 'BZR checkout done or server timeout'

  rm -fr build
  cp -r ${_bzrmod} build
  cd build

  unset LDFLAGS

  # use -DCMAKE_BUILD_TYPE=Release to optimize binaries or remove it for debug
  # use -Wno-dev to suppress developer specific warnings
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH=ON \
    -DCONFDIR='/etc' \
    -DPYTHON_EXECUTABLE='/usr/bin/python2' \
    .

  make -j1
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
