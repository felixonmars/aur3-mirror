# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=make381
_pkgname=make
pkgver=3.81
pkgrel=1
pkgdesc="GNU make utility to maintain groups of programs (Version 3.81, bin only)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/make"
license=('GPL')
groups=('base-devel')
depends=('glibc' 'sh')
install=${_pkgname}.install
source=(ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('a4e9494ac6dc3f6b0c5ff75c5d52abba')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver} 
  ./configure --prefix=/usr \
    --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -Dm755 make ${pkgdir}/usr/bin/make381
}
