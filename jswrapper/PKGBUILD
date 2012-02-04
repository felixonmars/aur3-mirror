# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=jswrapper
pkgver=0.2.0
pkgrel=1
pkgdesc="JavaScript Wrapper Library for QtWebKit"
arch=('i686' 'x86_64')
url="http://github.com/p2k/pygowave-qt"
license=('LGPL')
depends=('qt' 'qjson')
source=(http://github.com/p2k/pygowave-qt/tarball/$pkgname-$pkgver.tar.gz)
md5sums=('ec489bb526259fdeb4605d009a9e39fb')

build() {
  cd $srcdir/p2k-pygowave-qt-*
  cd JSWrapper

  qmake -config release || return 1
  make install INSTALL_ROOT=$pkgdir
}

# vim:set ts=2 sw=2 et:
