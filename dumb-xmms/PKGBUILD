# Contributor: Bjørn Lindeijer <bjorn@lindeijer.nl>
pkgname=dumb-xmms
pkgver=0.1
pkgrel=4
pkgdesc="XMMS plugin to play IT, XM, S3M and MOD with DUMB"
url="http://dumb.sourceforge.net/"
depends=('xmms')
makedepends=('dumb')
source=(http://dl.sourceforge.net/sourceforge/dumb/$pkgname-$pkgver.tar.gz)
md5sums=('a164b2a62792d0f099c4bff11215d6c8')

build() {
  cd $startdir/src/$pkgname
  make
  install -d $startdir/pkg/usr/lib/xmms/Input/
  install libdumb-xmms.so $startdir/pkg/usr/lib/xmms/Input/
}
