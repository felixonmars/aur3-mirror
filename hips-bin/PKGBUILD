# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://closure.ath.cx/aur-dev

pkgname=hips-bin
pkgver=0.1
pkgrel=1
pkgdesc="an IPS patcher (binary version)"
url="http://closure.ath.cx/hips"
arch=('i686' 'x86_64')
license=('BSD')
_arch=32
md5sums=('9eaf56d175b09e02ad505e9abeaacf2d')
if [ "$CARCH" = x86_64 ]; then
    md5sums=('3b5fa72255ae9c9edd69febb2192ec90')
    _arch=64
fi
source=("http://pub.lambda.ath.cx/patrick/hips/static/downloads/hips-$pkgver-${_arch}bit.tar")
options=(!strip)

package() {
    install -vDm755 hips "${pkgdir}/usr/bin/hips"
}
