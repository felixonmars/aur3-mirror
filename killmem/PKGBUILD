# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=killmem
pkgver=0.2.0
_pkgver=${pkgver}-20081101-104442
pkgrel=2
pkgdesc="Protect some memory against paging until you need free memory"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('83c49bbcdf29c477fab1d4fc2bc59255')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make || return 1
  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
