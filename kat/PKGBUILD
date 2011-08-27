# Contributor: lucke <lucke at o2 dot pl>
pkgname=kat
pkgver=0.6.4
pkgrel=1
pkgdesc="Framework designed to allow KDE applications to index and retrieve files."
url="http://kat.sourceforge.net/"
depends=('attr' 'sqlite3' 'kdelibs')
source=(http://dl.sourceforge.net/sourceforge/kat/$pkgname-$pkgver.tar.bz2)
md5sums=('e57c6ced1966b73ac1310583be63bd2d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
