# Maintainer: 404
# Contributors: atommixz, beroal, carstene1ns <arch carsten-teibes de>

pkgname=libtorrent-rasterbar-svn
pkgver=1.1.0.r10200
pkgrel=1
pkgdesc="C++ library that aims to be a good bittorrent implementation (development version)"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/libtorrent/"
license=('BSD')
depends=('boost-libs' 'python2' 'geoip')
makedepends=('boost' 'subversion')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=(${pkgname%-*}::"svn+http://svn.code.sf.net/p/libtorrent/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}/include/libtorrent

  _major=$(grep -o "define LIBTORRENT_VERSION_MAJOR.*" version.hpp | grep -o "[0-9]*")
  _minor=$(grep -o "define LIBTORRENT_VERSION_MINOR.*" version.hpp | grep -o "[0-9]*")
  _tiny=$(grep -o "define LIBTORRENT_VERSION_TINY.*" version.hpp | grep -o "[0-9]*")
  _rev=$(svnversion)
  printf "%i.%i.%i.r%i" $_major $_minor $_tiny ${_rev//[[:alpha:]]}
}

build() {
  cd ${pkgname%-*}

  export PYTHON="/usr/bin/python2"
  ./bootstrap.sh --prefix=/usr --enable-python-binding --with-libgeoip=system
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
