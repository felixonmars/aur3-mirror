# Contributor: pfm <nl081130@yahoo.de>
pkgname=osiv
pkgver=2.1.2
pkgrel=1
pkgdesc="Open Source Image Velocimetry (PIV)."
arch=(i686 x86_64)
url="http://osiv.sourceforge.net/"
license=('GPL')
depends=('libpng' 'libtiff' 'fftw')
source=(http://downloads.sourceforge.net/osiv/$pkgname-$pkgver.tar.gz)
md5sums=('9ae9730c1cb20a107ff7406bb7f49dd0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  # remove documentation (http://osiv.sourceforge.net/docs.html)
  rm -rf "$pkgdir/usr/share/osiv/"
 }