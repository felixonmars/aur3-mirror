# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=qstomp
pkgver=0.3.2
pkgrel=1
pkgdesc="STOMP implementation for Qt"
arch=('i686' 'x86_64')
url="http://github.com/p2k/QStomp"
license=('LGPL')
depends=('qt')
source=(http://github.com/p2k/QStomp/tarball/$pkgname-$pkgver.tar.gz)
md5sums=('f8fd1447a182e6599ed83a5c00b8a23b')

build() {
  cd $srcdir/p2k-QStomp-*

  qmake -config release || return 1
  make install INSTALL_ROOT=$pkgdir
}

# vim:set ts=2 sw=2 et:
