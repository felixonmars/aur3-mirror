# Contributor: Fabrizio Antonangeli <fabrizio.antonangeli@gmail.com>

pkgname=p2kmoto
_srcver=0.1
_rcver=rc1
pkgver=0.1_rc1
pkgrel=3
arch=(i686 x86_64)
pkgdesc="Driver for accessing the filesystem of Motorola cellular phones."
url="http://sourceforge.net/projects/moto4lin/"
license="GPL"
source=(http://kent.dl.sourceforge.net/sourceforge/moto4lin/$pkgname-${_srcver}-${_rcver}.tar.gz)
md5sums=(b162763cb8ac6c631444a724f29f36c6)

build() {
  cd $startdir/src/$pkgname-$_srcver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
