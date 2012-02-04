# Maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=picocom
pkgver=1.6
pkgrel=1
pkgdesc="Minimal dumb-terminal emulation program, very much like minicom"
url="http://code.google.com/p/picocom/"
#url="http://freshmeat.net/projects/picocom"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('f042e15fa76ab3349c74a70062aa210b527e6bdc')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}/
  make -e
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/
  install -D picocom "${pkgdir}"/usr/bin/picocom
  install -Dm644 picocom.8 "${pkgdir}"/usr/share/man/man8/picocom.8
}
