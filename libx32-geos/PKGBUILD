# $Id: PKGBUILD 78782 2012-10-24 15:17:40Z arodseth $
# Upstream Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=geos
pkgname=libx32-geos
pkgver=3.3.5
pkgrel=1.2
pkgdesc='C++ port of the Java Topology Suite (x32 ABI)'
arch=('x86_64')
url="http://trac.osgeo.org/geos/"
license=('LGPL')
depends=('libx32-gcc-libs' 'bash' "${_basepkgname}=${pkgver}")
makedepends=('gcc-multilib-x32')
options=('!libtool' '!emptydirs')
changelog=$_basepkgname.changelog
source=(
    "http://download.osgeo.org/$_basepkgname/$_basepkgname-$pkgver.tar.bz2"
    'platform-stub.h'
)
sha256sums=('3b513fbe2d155364d61e76d9c250d6d8e75b5166783a233596c744373cb5874f'
            '88bc0f82db4f4ca2f17eb1b5d69e5e77d15965edac02bc37d3bbb9e262895017')

build() {
  cd ${srcdir}/$_basepkgname-$pkgver

  export CC="gcc -mx32"
  export CXX="g++ -mx32"

  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  install="${pkgname}.install"

  cd ${srcdir}/$_basepkgname-$pkgver

  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/include/geos/platform.h" "${pkgdir}"
  rm -rf "${pkgdir}/usr/include"
  install -Dm644 "${pkgdir}/platform.h" "${pkgdir}/usr/include/geos/platform-x32.h"
  install -Dm644 "${srcdir}/platform-stub.h" "${pkgdir}/usr/include/geos/platform-stub.h"
  mv "${pkgdir}/usr/bin/geos-config" "${pkgdir}/usr/bin/geos-x32-config"
}
