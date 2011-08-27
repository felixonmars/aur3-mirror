# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=cmpfast
pkgver=0.2.3
_pkgver=${pkgver}-20100330-214523
pkgrel=1
pkgdesc="Fast compare two big binary files"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('6605881b500b74c9525ec2c851c09a03')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${_pkgver}"
  install -d ${pkgdir}/usr/bin || return 1
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
