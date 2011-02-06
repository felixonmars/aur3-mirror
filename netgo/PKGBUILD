# $Id: PKGBUILD,v 1.3 2007/11/10 15:43:15 pierre Exp $
pkgname=netgo
pkgver=0.5
pkgrel=2
pkgdesc="a tool for changing network settings quickly and easily"
arch=(i686 x86_64)
url="http://netgo.hjolug.org/"
license=("GPL")
depends=('qt')
source=(http://netgo.hjolug.org/files/v$pkgver/netgo-$pkgver.tar.gz)
md5sums=('fe62a4035e6449db9761f8724d26d458')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT=$startdir/pkg install
}
