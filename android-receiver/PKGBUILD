# Maintainer: Patrick Brisbin <pbrisbin@gmail.com>

pkgname=android-receiver
pkgver=1.0
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
md5sums=('d36ae9870501a6ff2f7d477d0febad9f'
         '871d2b6af67c6b8d958c053610b7b50a')
