# Maintainer: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=mingw32-qwt
pkgver=6.0.2
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw32)"
arch=('i686' 'x86_64')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw32-runtime' 'mingw32-qt4')
makedepends=('mingw32-gcc')
options=('!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
md5sums=('845837320328e3c92d049cc45c7bdbc2')

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

    export QTDIR=/usr/i486-mingw32/lib/qt4
    export PATH=${QTDIR}/bin:${PATH}

    cd "${srcdir}/qwt-${pkgver}"

    # Build release only
    sed -i 's|+= debug_and_release|+= release|' qwtbuild.pri
    sed -i '/+= build_all/d' qwtbuild.pri

    # No designer plugin:
    sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

    # This is a mingw build, so Windows prefix is used. Let's change it:
    sed -i "s|C:/Qwt-\$\$QWT_VERSION|/usr/i486-mingw32|" qwtconfig.pri

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
    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/i486-mingw32/lib/qt4 install

    cd "${pkgdir}/usr/i486-mingw32"

    # Move DLLs from lib to bin
    mkdir -p bin
    mv lib/*.dll bin/

    # Move features to share/qt/mkspecs
    mkdir -p share/qt4/mkspecs
    mv features share/qt4/mkspecs
}
