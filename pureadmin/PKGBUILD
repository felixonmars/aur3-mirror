# Contrubutor: zmeYski <zmeyski@fastmail.fm>
pkgname=pureadmin
pkgver=0.4
pkgrel=0
arch=('i686')
pkgdesc="Managment Utility for the PureFTPd"
url="http://purify.sourceforge.net/"
depends=('libglade' 'fam')
source=(http://dl.sourceforge.net/sourceforge/purify/pureadmin-$pkgver.tar.gz)
md5sums=('9600f192a66001d441b1e42e9102419e')
license="GPL"
build() {
  cd $startdir/src/pureadmin-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
