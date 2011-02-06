# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=timeout
pkgver=0.0.3
_pkgver=${pkgver}-20101021-011348
pkgrel=1
pkgdesc="Execute a command or pipe only for a given duration"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
changelog='ChangeLog'
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('bfa6de99fb68ef779e9313e87b2dc4df')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}.plus
}

# vim:set ts=2 sw=2 et:
