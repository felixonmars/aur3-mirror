# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Cheer Xiao <xiaqqaix AT gmail DOT com>
pkgname=m17n-contrib
pkgver=1.1.14
pkgrel=1
pkgdesc="Contributions (input methods) for m17n"
url="http://www.m17n.org"
arch=('any')
license=('GPL')
depends=('gawk')
source=(http://download.savannah.gnu.org/releases/m17n/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

md5sums=('ae8c8b57604144a3d40afe54d5a912a3')
