# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=count
pkgver=0.1.1
_pkgver=${pkgver}-20090921-223427
pkgrel=1
pkgdesc="Copy lines, shows progress"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('03b27527b9639b44a423f0821d684275')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make || return 1
}

package() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
