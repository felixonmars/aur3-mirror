# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Coenraad van der Westhuizen <chwesthuizen@gmail.com>

_pkgname=canorus
pkgname=$_pkgname-svn
pkgver=0.7.1358
pkgrel=1
pkgdesc="A free music score editor"
arch=(i686 x86_64)
url=http://sourceforge.net/projects/$_pkgname/
license=(GPL2 GPL3)
depends=(poppler-qt python2 qtwebkit)
makedepends=(cmake kdelibs swig ruby)
#htlatex lyx ps2pdf qcollectiongenerator) ## for docs
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!buildflags)
source=($pkgname::svn+https://$_pkgname.svn.sourceforge.net/svnroot/$_pkgname/trunk)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    echo $(cat $pkgname/VERSION | tr -d 'svn').$(svnversion "$SRCDEST"/$pkgname/)
}

prepare() {
    cd $pkgname/src/
    sed -i 's:PyString:PyBytes:g' scripting/swigpython.cpp
    sed -i 's:ui_::' ui/*.h
}

build() {
    cd $pkgname/
    install -d build/
    cd build/
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DQT_MOC_EXECUTABLE=moc-qt4 \
        -DQT_UIC_EXECUTABLE=uic-qt4
    make
}

package() {
    make -C $pkgname/build DESTDIR="$pkgdir" install
}
