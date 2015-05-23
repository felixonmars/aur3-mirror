# Novena HUB control software.
# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=novena-usb-hub
pkgbase=$pkgname-git
pkgver=1.3.r1.0.g7bf130b
pkgrel=1
pkgdesc='Test and overcurrent control for Novena internal / external ports.'
arch=('armv7h')
url="https://github.com/xobs/novena-usb-hub/"
license=('GPL2')
srcname=novena-usb-hub
makedepends=('git sed')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/xobs/novena-usb-hub.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
