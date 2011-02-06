# Contributor: Stiletto <blasux@blasux.ru>
pkgname=libbtree
pkgver=0.0.1alpha2
pkgrel=0
pkgdesc="Little library to read database in Multitran's BTREE format."
arch=('i686' 'x86_64')
url="http://multitran.sourceforge.net/"
license=('GPL')
depends=('glib2')
source=(http://downloads.sourceforge.net/sourceforge/multitran/libbtree-${pkgver}.tar.bz2)
md5sums=('742c99f00e4b5e8f7d7ac9a8c992ba79')

build() {
    cd $startdir/src/$pkgname-$pkgver

    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
