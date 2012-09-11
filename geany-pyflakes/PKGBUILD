# Maintainer: Jo De Boeck <grimpy.reaper@gmail.com>
pkgname=geany-pyflakes
pkgver=1.0.4
pkgrel=1
pkgdesc="Pyflakes support for geany"
arch=('x86_64' 'i686')
url="http://code.google.com/p/geany-pyflakes"
license=('GPL')
depends=('geany>=1.22')
makedepends=('intltool')
source=("http://geany-pyflakes.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha256sums=('0f4795e5c466a642d990e6ee0b462c08926b4397bf8d7f1420f9fef66dd39d92')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PLUGIN_DIR=`pkg-config --variable=libdir geany`/geany
  mkdir -p "$pkgdir/$PLUGIN_DIR"
  cp geanypyflakes.so "$pkgdir/$PLUGIN_DIR"
}

# vim:set ts=2 sw=2 et
