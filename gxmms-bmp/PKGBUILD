# Contributor: Enrique Tebari Barragan Corte <tebari@gmail.com>

pkgname=gxmms-bmp
pkgver=0.3.0
pkgrel=1
pkgdesc="The gxmms Panel Applet compiled for Beep Media Player"
url="http://www.nongnu.org/gxmms/"
makedepends=(intltool)
depends=(bmp gnome-panel)
source=(http://savannah.nongnu.org/download/gxmms/gxmms-$pkgver.tar.gz)
md5sums=('fd1faca60413ff3c893535d4a856c5ea')

build() {
  cd $startdir/src/gxmms-$pkgver
  ./configure --prefix=/opt/gnome --with-bmp
  make || return 1
  make prefix=$startdir/pkg/opt/gnome install
}
