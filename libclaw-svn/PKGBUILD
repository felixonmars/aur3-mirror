# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Nicoco <truenicoco_nospam_at_gmail_dot_com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>
# Maintainer: Quentin Stievenart <acieroid@awesom.eu>

pkgname=libclaw-svn
pkgver=288
pkgrel=1
pkgdesc="C++ Library Absolutely Wonderful"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('LGPL')
depends=('bash' 'libjpeg' 'libpng>=1.2.8' 'gcc-libs' 'boost-libs')
makedepends=('cmake>=2.4' 'patch' 'svn' 'boost')
provides=('libclaw')
conflicts=('libclaw')

_svnmod="libclaw"
_svntrunk="https://libclaw.svn.sourceforge.net/svnroot/libclaw/trunk"

build() {
  cd ${srcdir}
  msg "Connecting to SVN server..."
  if [ -d ${_svnmod}/.svn ]; then
    cd ${_svnmod} && svn up && cd ..
  else
    svn co ${_svntrunk} ${_svnmod} --config-dir ./${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_svnmod}-build
  cp -rf ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build/library
  sed -i "38i#include <zlib.h>" claw/png.hpp 

  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make || return 1
  make DESTDIR="$pkgdir" install 
}
