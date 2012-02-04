# Contributor: Alessio 'alexwizard' Sergi <sergi.alessio {at} gmail.com>
# Contributor: Sergej Pupykin
# Maintainer: Stefan Husmann <stefan-husmannt-online.de>

pkgname=taglib-svn
pkgver=1201208
pkgrel=1
pkgdesc="TagLib Audio Meta-Data Library"
arch=('i686' 'x86_64')
url="http://ktown.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=('sh' 'gcc-libs' 'zlib')
makedepends=('cmake' 'subversion')
provides=('taglib=1.6.3')
conflicts=('taglib')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/kdesupport/${_realname}
_svnmod=taglib

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [ -d ${_svnmod}-build ] && rm -rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DWITH_MP4=ON -DWITH_ASF=ON -DCMAKE_USE_RELATIVE_PATHS=ON
  make
  make DESTDIR=${pkgdir} install
}
