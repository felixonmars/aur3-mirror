# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=kguitar
pkgver=0.5.1
pkgrel=1
pkgdesc="A KDE Guitar tabulature editor"
arch=(i686 x86_64)
url="http://kguitar.sourceforge.net/"
license=('GPL')
depends=(kdelibs qt3 tse3)
source=(http://downloads.sourceforge.net/kguitar/$pkgname-$pkgver.tar.bz2)

md5sums=('9e6c07f0079eb7e8963613d25e16fca1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=`kde-config --prefix`
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
