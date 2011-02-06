# Maintainer: TDY <tdy@gmx.com>

pkgname=scythia
pkgver=0.9.3
pkgrel=2
pkgdesc="Just a small QT ftp client"
arch=('i686' 'x86_64')
url="http://scythia.free.fr"
license=('GPL')
depends=('qt')
source=(http://scythia.free.fr/wp-content/scythia_0.9.3-2-src.tar.gz)

build() {
  cd "$srcdir/scythia"
  qmake || return 1
  make || return 1
  install -Dm 755 $srcdir/scythia/bin/scythia $pkgdir/usr/bin/scythia
}

md5sums=('2286269b90c84f52463580a271f608b5')
