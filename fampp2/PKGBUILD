# Contributor: William Rea <sillywilly@gmail.com>
pkgname=fampp2
pkgver=5.1.0
pkgrel=1
pkgdesc="A C++ wrapper for fam"
url="http://fampp.sourceforge.net"
options=('NOLIBTOOL')
license="GPL"
depends=('fam' 'ferrisloki' 'glib2')
source=(http://dl.sourceforge.net/sourceforge/fampp/fampp2-$pkgver.tar.bz2)
md5sums=('087c3be67ed77f5e849fc82989e61b75')

build() {
  cd $startdir/src/fampp2-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
