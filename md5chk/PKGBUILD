# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=md5chk
pkgver=0.7.0
_pkgver=${pkgver}-20111017-143949
pkgrel=1
pkgdesc="Create md5sums for easy shell usage"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
changelog='ChangeLog'
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('c1d9ddea73e6e3de2bf355cf081c3d2c')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${_pkgver}"
  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
