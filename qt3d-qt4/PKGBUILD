# Maintainer: Christian Bühler <christian@cbuehler.de>
pkgname=qt3d-qt4
pkgver=456.fdad0d7
pkgrel=1
pkgdesc="Support for scripting Qt Quick applications in 3D using OpenGL"
arch=('x86_64')
url="https://qt.gitorious.org/qt/qt3d"
license=('LGPL')
depends=('mesa' 'qt4')
source=(git://gitorious.org/qt/qt3d.git#branch=qt4)
md5sums=('SKIP')

pkgver() {
    cd qt3d
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/qt3d"
	qmake-qt4 CONFIG+=package
	make
}

package() {
	cd "$srcdir/qt3d"
	make INSTALL_ROOT="${pkgdir}" install

    # Fix wrong path in prl files
    find "${pkgdir}/usr/lib" -type f -name '*.prl' \
        -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
}
