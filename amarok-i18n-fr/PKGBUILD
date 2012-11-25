pkgname=amarok-i18n-fr
pkgver=1323990
pkgrel=1
_pkgname=amarok
_pkgver=2.6.0
pkgdesc="The powerful music player for KDE (french translation)"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('amarok=2.6.0')
makedepends=('pkgconfig' 'automoc4' 'cmake')
source=("http://download.kde.org/stable/${_pkgname}/${_pkgver}/src/${_pkgname}-${_pkgver}.tar.bz2")
sha1sums=('2cfcdabb67436418ba0012075ba105bbb630b48d')
_svnmod=amarok-po-fr
_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/l10n-kde4/fr/messages/extragear-multimedia/"

build() {
    cd "${srcdir}"

    msg "Connecting to SVN server...."
    if [ -d ${_svnmod}/.svn ]; then
        msg "Updating SVN..."
        svn up "${_svnmod}"
    else
        msg "Checking out from SVN..."
        svn co "${_svntrunk}" "${_svnmod}"
    fi
    msg "SVN checkout done or server timeout."

    cd "${srcdir}/${_pkgname}-${_pkgver}/po/"

    grep -q 'add_subdirectory(fr)' CMakeLists.txt || echo 'add_subdirectory(fr)' >> CMakeLists.txt
    rm -Rf fr
    mkdir fr
    cp "${srcdir}/amarok-po-fr/amarok.po" fr/
    cp "${srcdir}/amarok-po-fr/amarok_scriptengine_qscript.po" fr/
    cp "${srcdir}/amarok-po-fr/amarokcollectionscanner_qt.po" fr/
    cp "${srcdir}/amarok-po-fr/amarokpkg.po" fr/
    echo 'file(GLOB _po_files *.po)' > fr/CMakeLists.txt
    echo 'GETTEXT_PROCESS_PO_FILES(fr ALL INSTALL_DESTINATION ${LOCALE_INSTALL_DIR} ${_po_files} )' >> fr/CMakeLists.txt

    cd "${srcdir}"
    rm -Rf build
    mkdir build
    cd build
    cmake ../${_pkgname}-${_pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make pofiles
}

package(){
    cd "${srcdir}"/build/po/fr
    make DESTDIR="${pkgdir}" install
}
