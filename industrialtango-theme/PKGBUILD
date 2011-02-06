# Contributor: Robert Hollencamp <rhollencamp@gmail.com>
pkgname=industrialtango-theme
pkgver=0.1
pkgrel=3
url="http://www.ubuntu.com"
pkgdesc="Gnome theme from Ubuntu"
arch=(i686 x86_64)
license=('GPL')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/i/industrialtango-theme/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('513052a7f2441a2738f083665c9cf52a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

