# Contributor: Johannes Schriewer <jschriewer@gmail.com>

pkgname=kcall
pkgver=0.5.2
pkgrel=2
pkgdesc="KCall is the future telephony application of KDE's Kontact"
url="http://www.basyskom.de/index.pl/kcall"
depends=('kdelibs')
source=("http://www.basyskom.de/uploads/74/14/$pkgname-$pkgver.tar.bz2" \
	"kcall-gcc-4.2-fix.patch")
md5sums=('952dd831f9297c4dc01f1959fa14c316'
	 '09d25325e9b508809d4c7f9307c06d93')
arch=('i686' 'x86_64')
license=('LGPL')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i ../kcall-gcc-4.2-fix.patch || return 1
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
