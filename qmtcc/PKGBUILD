# Contributor: Stiletto <blasux@blasux.ru>
pkgname=qmtcc
pkgver=0.0.1alpha1
pkgrel=0
pkgdesc="QT based frontend for multitran dictionary."
arch=('i686' 'x86_64')
url="http://multitran.sourceforge.net/"
license=('LGPL')
depends=('glib2' 'libfacet' 'libbtree' 'libmtsupport' 'libmtquery' 'qt3')
source=(http://downloads.sourceforge.net/sourceforge/multitran/qmtcc-${pkgver}.tar.bz2)
optdepends=('multitran-en-ru-en: Russian-English-Russian dictionary')
md5sums=('11f708e284b25ddcf303c5f33c3d213b')

build() {
    cd $startdir/src/$pkgname-$pkgver

    /opt/qt/bin/qmake || return 1
    make QMAKE=/opt/qt/bin/qmake || return 1
    make INSTALL_ROOT=$startdir/pkg install || return 1
}
