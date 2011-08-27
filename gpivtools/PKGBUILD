# Contributor: pfm <nl081130@yahoo.de>
pkgname=gpivtools
pkgver=0.6.0
pkgrel=2
pkgdesc="Command line programs for Particle Image Velocimetry."
arch=('i686' 'x86_64')
url="http://gpivtools.sourceforge.net/"
license=('GPL')
depends=('libgpiv' 'python' 'imagemagick')
source=(http://downloads.sourceforge.net/gpivtools/$pkgname-$pkgver.tar.gz)
md5sums=('a6b62763f0c21442701eecc665bf51fb')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

}
