# Contributor: lp76 <l.peduto@gmail.com>
pkgname=nrss
pkgver=0.3.9
pkgrel=3
pkgdesc="NCurses Feed Reader"
arch=('i686' 'x86_64')
url="http://www.codezen.org/nrss/"
license=("GPL")
source=(http://ftp.de.debian.org/debian/pool/main/n/nrss/${pkgname}_${pkgver}.orig.tar.gz)
depends=('ncurses' 'expat')
md5sums=('0673d5b18cee1f7229bed45db05f3c3e')

build() {
  cd $startdir/src/$pkgname-$pkgver/
  sed -i 's|ncursesw/panel.h|panel.h|' nrss.h # fixes compiling with arch ncurses
  make || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install || return 1
}
