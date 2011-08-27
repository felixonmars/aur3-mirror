# Contributor: Stiletto <blasux@blasux.ru>
pkgname=multitran-en-ru-en
pkgver=0.0.1alpha1
pkgrel=0
pkgdesc="Multitran English-Russian-English dictionary."
arch=('i686' 'x86_64')
url="http://multitran.sourceforge.net/"
license=('GPL')
depends=('glib2')
source=(http://downloads.sourceforge.net/sourceforge/multitran/multitran-data.tar.bz2)
md5sums=('7bedcb7cc3d20216ac1589a495b10a89')

build() {
    cd $startdir/src/multitran-data

    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
