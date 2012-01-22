# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=mingw32-qwt-static
pkgver=6.0.1
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw32)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://qwt.sourceforge.net"
depends=('mingw32-qt-static' 'mingw32-gcc')
options=('!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
md5sums=('ace68558eab873e2da7e641179c4ef0c')

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

    export QTDIR=/usr/i486-mingw32
    export QMAKESPEC=/usr/share/qt/mkspecs/win32-g++-cross

    cd "${srcdir}/qwt-${pkgver}"

    # Static build:
    sed -i 's|+= QwtDll|-= QwtDll|' qwtconfig.pri

    # No designer plugin:
    sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

    # This is a mingw build, so Windows prefix is used. Let's change it:
    sed -i "s|C:/Qwt-\$\$QWT_VERSION|${QTDIR}|" qwtconfig.pri

    # Make install locations consistent with Arch's native Qwt:
    sed -i 's|$${QWT_INSTALL_PREFIX}/doc|$${QWT_INSTALL_PREFIX}/share/doc/qwt|' qwtconfig.pri
    sed -i 's|$${QWT_INSTALL_PREFIX}/include|$${QWT_INSTALL_PREFIX}/include/qwt|' qwtconfig.pri

    # No need for docs:
    sed -i "s|= target doc|= target|" src/src.pro

    ${QTDIR}/bin/qmake qwt.pro

    make
}

package() {
    cd "${srcdir}/qwt-${pkgver}"
    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/i486-mingw32 install || return 1
}
