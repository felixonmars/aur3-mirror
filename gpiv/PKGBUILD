# Contributor: pfm <nl081130@yahoo.de>
pkgname=gpiv
pkgver=0.6.1
pkgrel=1
pkgdesc="GUI for Particle Image Velocimetry (PIV)."
arch=('i686' 'x86_64')
url="http://gpiv.sourceforge.net/"
license=('GPL')
depends=('libgnomeui' 'libgnomeprintui' 'libgpiv')
makedepends=('intltool')
source=("http://downloads.sourceforge.net/gpiv/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('3b121735e2d1344b936c54fcac019bd9'
         '63862f9d372e39267dd5e96a2db2c4db')
install=${pkgname}.install

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
 
  cd $srcdir
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}