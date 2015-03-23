# Maintainer: Lars Christensen <larsch at belunktum dk>

pkgname=raspi-off-button
pkgver=0.1
pkgrel=1
pkgdesc="Power-off via GPIO monitor for Raspberry PI"
arch=('armv6h' 'armv7h')
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=('MIT')
depends=('gcc-libs')
makedepends=('libbcm2835')
source=(https://github.com/larsch/raspi-off-button/archive/v0.1.tar.gz raspi-off-button.service)
md5sums=('02c834a99ccba19d37aa7601a096d6b7' 'eaf99d962563b48cc6488e2d08616127')
build() {
    cd "$srcdir/raspi-off-button-0.1"
    make
}
package() {
    cd "$srcdir/raspi-off-button-0.1"
    install -D "$SRCDEST/raspi-off-button.service" "$pkgdir/usr/lib/systemd/system/raspi-off-button.service"
    install -D raspi-off-button "$pkgdir/usr/bin/raspi-off-button"
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
