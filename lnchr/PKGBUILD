# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=lnchr
pkgver=0.0.1
pkgrel=1
pkgdesc="A minimalistic application launcher for Linux"
arch=('x86_64')
url="https://github.com/eyolfson/lnchr/"
license=('GPL3')
depends=('pango' 'sdl2')
source=("https://github.com/eyolfson/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4fbeb0a99ac2a58e134649c74fbd6ea6e390ce504c95d585c03e59c92c0dad3b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$pkgname-$pkgver/bin/lnchr" "$pkgdir/usr/bin/lnchr"
}
