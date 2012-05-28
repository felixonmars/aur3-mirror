# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

pkgname=fxt
pkgver=0.2.2
pkgrel=1
pkgdesc="Fast Kernel/User Tracing"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/fkt"
license=('GPL')
source=(http://download.savannah.gnu.org/releases/fkt/$pkgname-$pkgver.tar.gz)
md5sums=('d2b612fbb2d2857a8fd4657e83155503')

build() {
   cd $pkgname-$pkgver
   ./configure --prefix=/usr
   make -j1
   make -j1 DESTDIR=$pkgdir install
}
