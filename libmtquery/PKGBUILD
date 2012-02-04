# Contributor: Stiletto <blasux@blasux.ru>
pkgname=libmtquery
pkgver=0.0.1alpha3
pkgrel=0
pkgdesc="Set of usefull functions used in multitran library."
arch=('i686' 'x86_64')
url="http://multitran.sourceforge.net/"
license=('LGPL')
depends=('glib2' 'libfacet' 'libbtree' 'libmtsupport')
source=(http://downloads.sourceforge.net/sourceforge/multitran/libmtquery-${pkgver}.tar.bz2)
md5sums=('4774035db8a4319df17fb32888a0481d')

build() {
    cd $startdir/src/$pkgname-$pkgver

    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
