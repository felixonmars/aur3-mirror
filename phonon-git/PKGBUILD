# Maintainer:  Jekyll Wu <adaptee at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=phonon-git
pkgver=20130905_v4.6.0_415_g0018985
pkgrel=1
pkgdesc='The multimedia framework for KDE4'
arch=('i686' 'x86_64')
url='http://phonon.kde.org'
license=('LGPL')
depends=('qt4' 'phonon-backend' 'libpulse' 'libqzeitgeist')
optdepends=('pulseaudio: PulseAudio support')
makedepends=('cmake' 'automoc4' 'pulseaudio' 'qtwebkit' 'git')
conflicts=('phonon')
provides=('phonon')
options=('!strip')
source=("git://anongit.kde.org/phonon.git")
md5sums=('SKIP')

_gitname='phonon'

pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always | sed 's/-/_/g')"
}

build() {
    cd "$srcdir/${_gitname}"
    cmake  \
            -DCMAKE_BUILD_TYPE=debugfull \
            -DCMAKE_SKIP_RPATH=ON \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
            -DPHONON_QT_IMPORTS_INSTALL_DIR=/usr/lib/qt4/imports \
            -DPHONON_QT_MKSPECS_INSTALL_DIR=/usr/share/qt4/mkspecs \
            -DPHONON_QT_PLUGIN_INSTALL_DIR=/usr/lib/qt4/plugins/designer \
            -DPHONON_INSTALL_QT_EXTENSIONS_INTO_SYSTEM_QT=ON \
            -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
            .

    make
}

package() {
    cd "$srcdir/${_gitname}"
    make DESTDIR=${pkgdir} install || return 1

}
