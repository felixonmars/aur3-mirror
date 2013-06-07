# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=vocab-builder
pkgver=1.0.0
pkgrel=1
pkgdesc="A language tool to help build your vocabulary in a foreign language."
arch=(i686 x86_64)
url="https://launchpad.net/vbuilder"
license=('GPL')
depends=('gtk2' 'sqlite3' 'hicolor-icon-theme')
options=('!libtool')
install="$pkgname.install"
source=("http://launchpad.net/vbuilder/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('a49e43e1a997e07f0136570fa8b2a132')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
