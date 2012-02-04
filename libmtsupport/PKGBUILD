# Contributor: Stiletto <blasux@blasux.ru>
pkgname=libmtsupport
pkgver=0.0.1alpha2
pkgrel=0
pkgdesc="Set of usefull functions used in multitran library."
arch=('i686' 'x86_64')
url="http://multitran.sourceforge.net/"
license=('GPL')
depends=('glib2')
source=(http://downloads.sourceforge.net/sourceforge/multitran/libmtsupport-${pkgver}.tar.bz2)
md5sums=('25eb7eabc6bbd6c00be6c2fe020312e1')

build() {
    cd $startdir/src/$pkgname-$pkgver

    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
