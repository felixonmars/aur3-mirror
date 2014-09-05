# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dscanner
pkgver=0.1.0
pkgrel=1
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
makedepends=('dmd' 'libphobos' 'make')
url="https://github.com/Hackerpilot/Dscanner"
license=('Boost')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Hackerpilot/$pkgname/tar.gz/$pkgver)
sha256sums=('a41c88000e1e41fe24f615c7d20e3c309f79d226f6ac88e3ac60ae3ee6642617')
options=('!strip') #Because it's small anyway and symbols are useful as it is still in development

build() {
  cd "$srcdir/${pkgname^}-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/${pkgname^}-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE_1_0.txt"

  msg 'Installing binary...'
  install -Dm 755 dscanner "$pkgdir/usr/bin/dscanner"
}
