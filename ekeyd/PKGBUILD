# Maintainer: Thomas Preissler <thomas at preissler dot co dot uk>

pkgname=ekeyd
pkgver=1.1.4
pkgrel=7
pkgdesc="Tools to work with the Entropy Key"
arch=('i686' 'x86_64')
url="http://www.entropykey.co.uk/"
license=('MIT')
depends=(lua51 lua51-socket)
optdepends=('perl: for the munin plugin')
source=("http://www.entropykey.co.uk/res/download/$pkgname-$pkgver.tar.gz"
	"ekeyd.service"
        "egd-linux.service")
sha256sums=('147ca4ff964ab7b344a08d3cd6f9b1bf03ba18776a1941d603681d8102cce0c8'
            '09fcea2769815ec0df2ab1e110a76d6bbddd646e01b88fffd372df3329380f0d'
            'f60ab11cd29e7c31bf0bb28bb83d6de07eca7a736fb2c4152e05506b982168d6')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # In place patching:

  # There is a mismatching parenthesis/curly brace.
  sed -i -e 's/(DESTDIR}/{DESTDIR}/g' Makefile

  # ENTROPYKEY_KEY_SERIAL is not defined anywhere, ENTROPY_KEY_SERIAL was
  # certainly meant.
  sed -i -e 's/ENTROPYKEY_KEY_SERIAL/ENTROPY_KEY_SERIAL/g' udev/entropykey.sh

  # This makes the rule rejected and I don't know why, if you do please tell me.
  sed -i -e 's/BUS=="usb", //g' udev/*/*.rules
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make BUILD_ULUSBD=yes BUILD_EGDLINUX=yes
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BUILD_ULUSBD=yes BUILD_EGDLINUX=yes DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -D -m644 udev/centos6/60-entropykey.rules "${pkgdir}/lib/udev/rules.d/60-entropykey.rules"
  install -D -m755 udev/entropykey.sh "${pkgdir}/lib/udev/entropykey.sh"

  install -D -m644 "${srcdir}/ekeyd.service" "${pkgdir}/lib/systemd/system/ekeyd.service"
  install -D -m644 "${srcdir}/egd-linux.service" "${pkgdir}/lib/systemd/system/egd-linux.service"
}

