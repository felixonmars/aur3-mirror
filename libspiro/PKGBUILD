# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=libspiro
pkgver=20071029
pkgrel=1
pkgdesc="clothoid to bezier conversion library"
arch=('i686' 'x86_64')
url="http://libspiro.sourceforge.net/"
license=('GPL')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}_src-$pkgver.tar.bz2)
md5sums=('ab6aaa50bbd8fa55e78f8b8b0112f6cd')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
