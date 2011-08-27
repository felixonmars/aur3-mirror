# Contributor: Benjamin Jorand <benjamin.jorand@gmail.com>
pkgname=firebox
pkgver=0.5.0
pkgrel=1
pkgdesc="Firebox is yet another Window Manager for X11 systems"
arch=('i686')
url="http://firebox.intuxication.org"
license=('GPL')
depends=('libxml2' 'libxft' 'libjpeg' 'libpng' 'libxrender' 'libx11')
source=(http://download.gna.org/firebox/tarballs/$pkgname-$pkgver.tar.gz)
md5sums=('de62dba9ab1bed217c744a97be9f0481')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
