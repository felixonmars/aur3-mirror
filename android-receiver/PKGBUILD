# Maintainer: Patrick Brisbin <pbrisbin@gmail.com>

pkgname=android-receiver
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple receiver for android notifier"
arch=('any')
url="https://github.com/pbrisbin/android-receiver"
license=('MIT')
depends=('libnotify')
source=(${pkgname}.c Makefile)

build() {
  make
}

package() {
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('0c685faca07b881ecd5a4e60f3705536'
         '30fa8801633c221bf57795dff0aad871')
