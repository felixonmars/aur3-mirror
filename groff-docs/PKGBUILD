# Maintainer: Ecmel Ercan <ecmel.ercan@gmail.com>
pkgname=groff-docs
pkgver=1.21
pkgrel=4
pkgdesc="Documentation for GNU troff text-formatting system"
url="http://www.gnu.org/software/groff/groff.html"
arch=('any')
license=('GPL')
depends=('groff')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
options=(!strip)
source=("ftp://ftp.gnu.org/gnu/groff/groff-$pkgver.tar.gz")
md5sums=('8b8cd29385b97616a0f0d96d0951c5bf')

build() {
  cd "$srcdir/groff-$pkgver"
  ./configure --without-x
  make
  make prefix=$srcdir install
}

package() {
  cd "$srcdir/share/doc/"
  install -d "$pkgdir/usr/share/doc/"
  cp -rf "groff-$pkgver" "$pkgdir/usr/share/doc/"
}

