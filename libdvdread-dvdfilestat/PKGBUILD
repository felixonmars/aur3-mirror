# $Id$
# Maintainer: dan saul <aur@cryingwolf.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libdvdread-dvdfilestat
pkgver=4.1.3
pkgrel=3
pkgdesc="libdvdread provides a simple foundation for reading DVD video disks"
arch=(i686 x86_64)
url="http://www.mplayerhq.hu/MPlayer/releases/dvdnav/"
license=('GPL')
depends=('glibc')
makedepends=('libdvdcss')
optdepends=('libdvdcss: for decoding encrypted DVDs')
options=('!libtool')
replaces=('libdvdread')
conflicts=('libdvdread')
provides=('libdvdread=4.1.3')
source=(http://www.mplayerhq.hu/MPlayer/releases/dvdnav/libdvdread-${pkgver}.tar.bz2 dvd_reader.h.patch dvd_reader.c.patch)
md5sums=('6dc068d442c85a3cdd5ad3da75f6c6e8' 'fba2d06c2bfacaa6dd66186476a80289' '77c0a4311656d4d5561f0753152a9efc')

build() {
  cd "${srcdir}/libdvdread-${pkgver}/src"
  patch -Np0 -i ${srcdir}/dvd_reader.h.patch
  patch -Np0 -i ${srcdir}/dvd_reader.c.patch
  
  cd "${srcdir}/libdvdread-${pkgver}"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

