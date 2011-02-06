# Contributor: Carlo Casta <carlo.casta at gmail dot com>

pkgname=bmp-docklet
pkgver=1.3
pkgrel=1
pkgdesc="A plugin to control BMP (Beep Media Player) via a tray-icon"
arch=('i686' 'x86_64')
url="http://mark.xnull.de"
license=('GPL')
depends=('bmp' 'perlxml')
options=(!libtool)
source=(http://mark.xnull.de/pub/bmp-docklet/$pkgname-$pkgver.tar.bz2)
md5sums=('e8ef1599d2dcdc312ed1b9f43d2e8d60')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --disable-dependency-tracking
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
