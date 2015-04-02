# Contributor: Stas Solovey <whats_up@tut.by>
#
pkgname=gxneur-unstable
pkgver=0.17.0+hg1231
pkgrel=1
pkgdesc="GTK frontend for XNeur"
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur-unstable>=${pkgver}" 'hicolor-icon-theme' 'gconf')
conflicts=('gxneur')
install=${pkgname}.install
source=("https://launchpad.net/~andrew-crew-kuznetsov/+archive/ubuntu/crew/+files/gxneur_0.17.0%2Bhg1231.orig.tar.gz")

md5sums=('SKIP')

build() {
   cd $srcdir/gxneur-0.17.0

   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/gxneur-0.17.0
   make DESTDIR=$pkgdir install
}
