# Contributor: Michal Kaliszka <desmont@gmail.com>

pkgname=nokryptia
pkgver=1.3
pkgrel=1
pkgdesc="This program is made for the Nokia 5510 to put music on your\
 mobile."
url="http://tuxmobil.org/nokryptia.html"
license=""
depends=(id3lib)
source=(http://tuxmobil.org/software/nokryptia/$pkgname-$pkgver.tar.bz2)
md5sums=(10c9509d7a78df9677aa4e92f753668a)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
