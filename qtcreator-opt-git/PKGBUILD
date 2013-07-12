# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Alexander Drozdov <adrozdoff@gmail.com>

pkgname=qtcreator-opt-git
pkgver=20130711_v2.8.0_12_g457b5e2
pkgrel=1
pkgdesc="Qt Creator is a new cross-platform integrated development environment (IDE) tailored to the needs of Qt developers. Installs in /opt and can coexists with other Qt Creator installations"
arch=('i686' 'x86_64')
url="http://www.qtsoftware.com/products/developer-tools"
license=('LGPL')
depends=('qt5-base'
         'qt5-quick1'
         'qt5-tools'
         'qt5-declarative'
         'qt5-jsbackend'
         'qt5-script'
         'qt5-sensors'
         'qt5-svg'
         'qt5-tools'
         'qt5-webkit'
         'qt5-x11extras'
         'qt5-xmlpatterns')
makedepends=('git')
optdepends=('gdb: for the debugger')
options=(docs)
source=('git+https://git.gitorious.org/qt-creator/qt-creator.git#branch=2.8'
        'qtcreator.desktop')

_gitname="qt-creator"

pkgver() {
    cd "$srcdir/$_gitname"
    echo "$(LANG=C date '+%Y%m%d')_$(git describe --always | sed 's/-/_/g')"
}

prepare() {
    cd "${srcdir}"

    if [ -d ${srcdir}/build ]; then
        rm -rf ${srcdir}/build
    fi

    mkdir build
    cd build

    mkdir -p share/doc/qtcreator
    touch share/doc/qtcreator/qtcreator.qch

    qmake-qt5 \
      QTC_PREFIX=/opt/qtcreator-git \
      ${srcdir}/${_gitname}/qtcreator.pro
}

build() {
    cd "${srcdir}/build"
    make
}

package() {
    cd ${srcdir}/build

    make INSTALL_ROOT="${pkgdir}" install

    install -Dm644 ${srcdir}/qtcreator.desktop ${pkgdir}/usr/share/applications/qtcreator-git.desktop
    install -Dm644 ${srcdir}/${_gitname}/LGPL_EXCEPTION.TXT ${pkgdir}/usr/share/licenses/qtcreator-opt/LGPL_EXCEPTION.TXT

    #mv ${pkgdir}/bin/* ${pkgdir}/opt/qtcreator-git/bin
    #rm -rf ${pkgdir}/bin
}

md5sums=('SKIP'
         '2926950a26905a8b10815906eac03c66')
