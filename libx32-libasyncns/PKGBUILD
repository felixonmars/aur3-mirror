# $Id: PKGBUILD 63987 2012-02-08 18:51:22Z pschmitz $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgbasename=libasyncns
pkgname=libx32-$_pkgbasename
pkgver=0.8
pkgrel=6.1
pkgdesc="A C library for Linux/Unix for executing name service queries asynchronously (x32 ABI)"
arch=(x86_64)
url="http://0pointer.de/lennart/projects/libasyncns"
license=('LGPL')
options=('!libtool')
depends=('libx32-glibc' $_pkgbasename)
makedepends=('gcc-multilib-x32')
source=(http://0pointer.de/lennart/projects/libasyncns/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('1f553d6ce1ad255bc83b3d8e9384f515')

build() {
  cd ${srcdir}/libasyncns-${pkgver}

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  # Fix libdir
  sed -i '/^libdir=/s:/lib:/libx32:' *.pc.in

  ./configure --prefix=/usr --disable-lynx --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/libasyncns-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{include,share}
}
