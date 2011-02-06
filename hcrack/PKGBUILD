#Maintainer: Tehacjusz Flovus (thc_flow) <flow@krolnet.pl>

pkgname=hcrack
pkgver=2.0
pkgrel=1
arch=('any')
pkgdesc="Very simple hash cracker written in python"
url="http://twitter.com/thc_flow"
license=('GPL')
depends=('python>=2.6')
makedepends=('pkgconfig')
source=("http://thc.krolnet.pl/hck/$pkgname-$pkgver.tar.bz2")
md5sums=('cf46048f28f710ecf66db94b9627d155')

build() {
  cd $srcdir/$pkgname
  cp -r * $pkgdir
  chmod +x $pkgdir/usr/bin/*
}
