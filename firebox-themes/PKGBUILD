# Contributor: Benjamin Jorand <benjamin.jorand@gmail.com>
pkgname=firebox-themes
pkgver=0.5.0
pkgrel=1
pkgdesc="Firebox themes"
arch=('i686')
url="http://firebox.intuxication.org"
license=('GPL')
depends=('libxml2' 'libxft' 'libjpeg' 'libpng' 'libxrender' 'libx11')
source=(http://download.gna.org/firebox/tarballs/$pkgname-$pkgver.tar.gz)
md5sums=('8d8724fc2e3acfdbafbd63a6a6b2bcf2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
