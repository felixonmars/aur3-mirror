#Maintainer: Bob Finch <w9ya@qrparci.net>

pkgname=gpsk31
pkgver=0.5
pkgrel=1
pkgdesc="GTK+ 2.0 Ham Radio PSK31 client"
url="http://www.qsl.net/pg4i/linux/gpsk31.html"
depends=('xlog' 'gtk2>2.4' 'hamradio-menus')
source=(http://www.qsl.net/pg4i/download/$pkgname-$pkgver.tar.gz)
arch=('i686' 'x86_64')
license=('GPL3')
md5sums=('27eab722e13d7165514578189b2f3d45')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
#  make prefix=$startdir/pkg/usr install-strip
  make prefix=$startdir/pkg/usr install
}
