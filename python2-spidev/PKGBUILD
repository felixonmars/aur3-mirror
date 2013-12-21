# Maintainer: TDY <tdy@archlinux.info>

pkgname=python2-spidev
pkgver=2.0
pkgrel=1
pkgdesc="Python bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/doceme/py-spidev"
license=('GPL')
depends=('python2')
source=($pkgname::git://github.com/doceme/py-spidev)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
