# Contributor: Jeffrey Grembecki <jeff * mcmedia com au>

pkgname=dvdspanky
pkgver=1.0.10
pkgrel=2
pkgdesc="CLI tool to transcode any video into DVD MPEG data easily with many features"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/dvdspanky/"
license="GPL"
depends=('mplayer' 'transcode' 'mjpegtools' 'feh' 'sox')
makedepends=('pcre>=5.0')
source=(http://download.savannah.nongnu.org/releases/dvdspanky/$pkgname-$pkgver.tar.gz)
md5sums=('dc9dd2a1d2ede4f54037ece1eb843e09')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

