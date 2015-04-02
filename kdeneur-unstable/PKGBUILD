# Contributor: Stas Solovey <whats_up@tut.by>
#
pkgname=kdeneur-unstable
pkgver=0.17.0+hg1231
pkgrel=1
pkgdesc="Qt frontend for XNeur"
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'kdelibs' "xneur-unstable>=${pkgver}")
conflicts=('kdeneur')
install=${pkgname}.install
source=("https://launchpad.net/~andrew-crew-kuznetsov/+archive/ubuntu/crew/+files/kdeneur_0.17.0%2Bhg1231.orig.tar.gz")

md5sums=('SKIP')

build() {
   cd $srcdir/kdeneur-0.17.0

   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/kdeneur-0.17.0
   make DESTDIR=$pkgdir install
}
