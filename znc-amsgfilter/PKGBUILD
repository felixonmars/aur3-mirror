# Maintainer: Kin <kurisui at gmail dot com>
pkgname=znc-amsgfilter
pkgver=1838
pkgrel=1
pkgdesc="ZNC Module to filter amsgs (messages being send to all joined channels) so that they won't appear in specified channels."
arch=(i686 x86_64)
url=http://en.znc.in/wiki/Amsgfilter
license=(custom)
depends=(gcc-libs perl openssl c-ares tcl znc)
makedepends=(perl openssl gcc pkgconfig tcl znc)
source=(amsgfilter.cpp)
md5sums=('fc7e875c5f5d5a53208c69c4b4eec583')

build() {

 znc-buildmod amsgfilter.cpp|| return 1
 mkdir -p $pkgdir/usr/lib/znc || return 1
 mv *.so $pkgdir/usr/lib/znc || return 1

}

