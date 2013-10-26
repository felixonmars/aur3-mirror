# Maintainer: Joakim Reinert <mail[at]jreinert[dot]com>
pkgname=cryptodev-linux
pkgver=1.6
pkgrel=2
pkgdesc="Cryptodev-linux is a device that allows access to Linux kernel cryptographic drivers. Its API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
url="http://cryptodev-linux.org/"
arch=('armv7h')
license=('GPLv2')
depends=('linux-am33x')
makedepends=('linux-am33x-headers')
provides=('cryptodev_friendly')
source=("http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.install")
install="${pkgname}.install"
sha256sums=('75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f'
            '0aa2e82bf7859304d99260601307d81c6d24412227f168a3437427d46fca265b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 cryptodev.ko "${pkgdir}/usr/lib/modules/$(uname -r)/extra/cryptodev.ko"
  install -D -m644 crypto/cryptodev.h "${pkgdir}/usr/include/crypto/cryptodev.h"
}

# vim:set ts=2 sw=2 et:
