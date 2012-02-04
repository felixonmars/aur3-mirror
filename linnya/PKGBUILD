# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=linnya
pkgver=1.0.2
pkgrel=2
pkgdesc="A free music player"
arch=('i686' 'x86_64')
url="http://code.google.com/p/linnya/"
license=('GPL2')
depends=('gstreamer0.10-ffmpeg' 'gtk2')
makedepends=('pkg-config')
source=(http://linnya.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('690e6452b961546208c3eec2b094175a')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
