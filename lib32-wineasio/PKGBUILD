# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

_pkgbasename=wineasio
pkgname=lib32-${_pkgbasename}
pkgver=0.9.2
pkgrel=1
pkgdesc="Steinberg ASIO driver implementation for Wine (32bit lib for multilib)"
arch=('x86_64')
url="http://sourceforge.net/projects/wineasio/"
license=('LGPL')
depends=('wine' 'lib32-jack')
makedepends=('steinberg-asio' 'gcc-multilib')

install=${pkgname}.install
source=("http://downloads.sourceforge.net/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
md5sums=('aef9c22557f37c4bee393aab0232c63b')

prepare() {
  cd "${srcdir}/${_pkgbasename}"
  cp /usr/include/steinberg-asio/asio.h asio.h
}

build() {
  cd "${srcdir}/${_pkgbasename}"
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  install -Dm755 "${_pkgbasename}.dll.so" "${pkgdir}/usr/lib32/wine/${_pkgbasename}.dll.so"
}
# vim:set ts=2 sw=2 et:
