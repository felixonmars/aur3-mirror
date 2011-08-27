# Contributor: Stiletto <blasux@blasux.ru>
pkgname=libfacet
pkgver=0.0.1alpha2
pkgrel=0
pkgdesc="Set of extented c++ std::locale facets used by main multitran library."
arch=('i686' 'x86_64')
url="http://multitran.sourceforge.net/"
license=('GPL')
depends=('glib2' 'libmtsupport')
source=(http://downloads.sourceforge.net/sourceforge/multitran/libfacet-${pkgver}.tar.bz2)
md5sums=('e22f7014df0dfb07a7bc5e00410c18ca')

build() {
    cd $startdir/src/$pkgname-$pkgver

    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
