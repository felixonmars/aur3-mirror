# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Benoit Rouits <brouits@free.fr>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=jackie
pkgver=0.5
pkgrel=3
pkgdesc="A small gtk+ monitor application to start and stop JACK"
arch=('i686' 'x86_64')
url="http://herewe.servebeer.com/jackie/"
license=('GPL')
depends=('gtk2' 'jack' 'desktop-file-utils')
install="$pkgname.install"
source=("http://brouits.free.fr/jackie/releases/$pkgname-$pkgver.tar.gz")
md5sums=('6024fd78896579d6c536a1ab854726ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
