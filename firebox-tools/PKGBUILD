# Contributor: Benjamin Jorand <benjamin.jorand@gmail.com>
pkgname=firebox-tools
pkgver=0.5.0
pkgrel=1
pkgdesc="Firebox Tools"
arch=('i686')
url="http://firebox.intuxication.org"
license=('GPL')
depends=('gtk2' 'libxml2' 'libxft' 'libjpeg' 'libpng' 'libxrender' 'libx11')
source=(http://download.gna.org/firebox/tarballs/$pkgname-$pkgver.tar.gz)
md5sums=('c98ca7867940c504cbc40021ebf7056c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
