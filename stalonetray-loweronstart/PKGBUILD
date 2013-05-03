# Maintainer: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
_pkgname=stalonetray
pkgname=$_pkgname-loweronstart
pkgver=0.8.1
pkgrel=2
pkgdesc="STAnd-aLONE sysTRAY with --lower-on-start option"
arch=('i686' 'x86_64')
url="http://stalonetray.sourceforge.net"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('libxpm')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2
        lower-window.patch)
md5sums=('3bf4c7e5e3c077f26242b37a8e008774'
         '5e1698266f84aa08d53bfa3a54ce91bb')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 -i ../lower-window.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m644 stalonetrayrc.sample $pkgdir/etc/stalonetrayrc
}
