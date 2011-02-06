#contributor: benetnash<starbreaker@op.pl>
pkgname=gai-blobs
pkgver="0.2b"
pkgrel=1
pkgdesc="Applet showing a bunch of moving blobs"
url="http://gai.sourceforge.net/"
license="GPL"
depends=('gai')
makedepends=('make')
source=(http://switch.dl.sourceforge.net/sourceforge/gai/$pkgname-$pkgver.tar.bz2)
md5sums=('eae51111de98a4d574ed6643e9b7bb97')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}

