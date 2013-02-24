pkgname=xbiso
pkgver=0.6.1
pkgrel=1
arch="x86_64"
license=(GPL)
pkgdesc="XBOX XDVDfs ISO Extraction Util"
url="http://sourceforge.net/projects/xbiso"
depends=(gcc)
md5sums=(bf4c0e789068ff616de1821c80194431)
source=(http://surfnet.dl.sourceforge.net/sourceforge/xbiso/xbiso-0.6.1.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make
  install -d $startdir/pkg/usr/bin
  install -m 755 xbiso $startdir/pkg/usr/bin
}
