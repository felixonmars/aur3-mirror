# Contributor: Runner <runnerwiz [at] gmail.com>
pkgname=sokowiz
pkgver=0.0.2
pkgrel=1
pkgdesc="An implementation of the famous sokoban puzzle game."
arch=('i686' 'x86_64')
license=('BSD')
url="http://sokowiz.sourceforge.net"
depends=('sdl')
source=(http://downloads.sourceforge.net/sokowiz/$pkgname-$pkgver.tar.gz)
md5sums=('68533454f422908d8dd9a89a825f2154')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
