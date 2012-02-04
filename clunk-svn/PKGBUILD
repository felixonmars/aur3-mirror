# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=clunk-svn
pkgver=112
pkgrel=1
pkgdesc="open-source C++ library for real-time 3D sound generation"
arch=('i686' 'x86_64')
url='http://media.netive.ru/clunk/'
license=('LGPL')
depends=('sdl' 'sdl_mixer')
makedepends=('scons')
optdepends=('doxygen: generate API docs')
conflicts=('clunk')
provides=('clunk')
source=()
md5sums=()

_svntrunk=https://clunk.svn.sourceforge.net/svnroot/clunk/trunk
_svnmod=trunk

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  scons || return 1
  install -Dm755 libclunk.so ${pkgdir}/usr/lib/libclunk.so

  rm -rf ${srcdir}/$_svnmod-build
}
