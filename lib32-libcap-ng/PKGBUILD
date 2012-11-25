# Maintainer: josephgbr <rafael.f.f1 at gmail.com>

_pkgbase=libcap-ng
pkgname=lib32-$_pkgbase
pkgver=0.7.3
pkgrel=1
pkgdesc="A library making programming with POSIX capabilities easier than traditional libcap (32 bit)"
arch=('x86_64')
url="http://people.redhat.com/sgrubb/libcap-ng/"
license=('GPL2' 'LGPL2.1')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://people.redhat.com/sgrubb/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('610afb774f80a8032b711281df126283')

build() {
  export CC='gcc -m32'
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --enable-static=no --with-python=no --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{bin,include,share}
}
