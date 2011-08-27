# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Contributor: Leen Jewel <leenjewel@gmail.com>
pkgname=kumofs
pkgver=0.4.11
pkgrel=1
pkgdesc="Kumofs is a simple and fast distributed key-value store."
arch=(i686 x86_64)
url="http://kumofs.sourceforge.net/"
license=('GPL')
depends=('tokyocabinet' 'msgpack')
makedepends=('jemalloc')
source=(http://github.com/downloads/etolabo/kumofs/$pkgname-$pkgver.tar.gz)
md5sums=('9519c93332dd770ea96ae6e43868ccc4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --with-jemalloc
  make || return 1
  make install
}

