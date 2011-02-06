# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=pygowave-api
pkgver=0.3.0
pkgrel=1
pkgdesc="API Library for PyGoWave"
arch=('i686' 'x86_64')
url="http://github.com/p2k/pygowave-qt"
license=('LGPL')
depends=('qt' 'qstomp')
source=(http://github.com/p2k/pygowave-qt/tarball/$pkgname-$pkgver.tar.gz)
md5sums=('ec489bb526259fdeb4605d009a9e39fb')

build() {
  cd $srcdir/p2k-pygowave-qt-*
  cd PyGoWaveApi

  qmake -config release || return 1
  make install INSTALL_ROOT=$pkgdir
}

# vim:set ts=2 sw=2 et:
