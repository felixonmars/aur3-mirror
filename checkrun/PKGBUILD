# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=checkrun
pkgver=0.0.2
_pkgver=${pkgver}-20090110-081959
pkgrel=3
pkgdesc="Program watchdog to terminate a program with starving output"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
changelog='ChangeLog'
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('5e8b7be5d7f916796f2a1a4805560a17')

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
