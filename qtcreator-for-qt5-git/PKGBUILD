# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator

pkgname=qtcreator-for-qt5-git
pkgver=20121028
pkgrel=1
pkgdesc="Qt Creator is a new cross-platform integrated development environment (IDE) tailored to the needs of Qt developers."
arch=('i686' 'x86_64')
url="http://www.qtsoftware.com/products/developer-tools"
license=('LGPL')
depends=('qt5-qtbase-git' 'qt5-qtscript-git' 'qt5-qtquick1-git' 'qt5-qttools-git' 'qt5-qtxmlpatterns-git')
makedepends=('git' 'gdb')
optdepends=('gdb: for the debugger')
provides=('qtcreator')
conflicts=('qtcreator')
source=('qtcreator.desktop')
md5sums=('cec76e79b49a0ef2f897cbd83764c131')

_gitroot="git://gitorious.org/qt-creator/qt-creator.git"
_gitname="qt-creator"

build() {
    msg "Connecting to GIT server"

    if [ -d ${srcdir}/$_gitname ] ; then
        cd ${srcdir}/$_gitname && git pull origin || return 1
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname || return 1
    fi

    msg "GIT checkout done or server timeout"

    cd "${srcdir}/${_gitname}" || return 1

    msg "Starting make in quiet mode"

    if [ -d ${srcdir}/build ]; then
        cd ${srcdir}/build
    else
        mkdir ${srcdir}/build
        cd ${srcdir}/build
    fi
    mkdir -p share/doc/qtcreator
    touch share/doc/qtcreator/qtcreator.qch

    export PATH=/opt/qt5/bin:$PATH

    # to enable the qml designer you need to add QT_PRIVATE_HEADERS=/path/to/your/qt/source/include to the qmake command
    /opt/qt5/bin/qmake ${srcdir}/${_gitname}/qtcreator.pro
    make
}

package() {
    cd "${srcdir}/build"

    export PATH=/opt/qt5/bin:$PATH

    make INSTALL_ROOT="${pkgdir}/opt/qt5" install
    install -Dm644 ${srcdir}/qtcreator.desktop ${pkgdir}/usr/share/applications/qtcreator.desktop || return 1
    install -Dm644 ${srcdir}/$_gitname/LGPL_EXCEPTION.TXT ${pkgdir}/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT || return 1
}
