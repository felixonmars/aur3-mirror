# Maintainer: Patrick Brisbin <pbrisbin@gmail.com>

pkgname=android-receiver
pkgver=0.0.2
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
md5sums=('288a7a8e398e6e6638906c1e9d7e5306'
         '871d2b6af67c6b8d958c053610b7b50a')
