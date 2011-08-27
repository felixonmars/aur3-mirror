# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=ermixer
pkgver=0.8
pkgrel=1
pkgdesc="A command-line, ncurses, and (optional) Qt-GUI OSS audio mixer"
arch=('i686')
url="http://ermixer.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'gcc-libs')
optdepends=('qt: QT GUI')
source=(http://downloads.sourceforge.net/ermixer/$pkgname-$pkgver.tar.gz)
md5sums=('ce6e896c7c2678c98ff9d841d3504003') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
