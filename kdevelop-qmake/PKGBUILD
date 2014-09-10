# Contributos: Vincenzo Comito <clynamen@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=kdevelop-qmake
pkgver=20140806
pkgrel=1
pkgdesc="Qt's qmake build system plugin for KDevelop - latest stable"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform')
optdepends=('kdevelop')
makedepends=('cmake' 'automoc4' 'git' 'kdevelop-pg-qt')
provides=('kdevelop-qmake')
conflicts=('kdevelop-qmake')

_gitroot="git://anongit.kde.org/kdev-qmake.git"
_gitname="qmake"
_gitbranch="1.7"

pkgver() {
    date +%Y%m%d
}

build() {
    cd "$srcdir"
    msg "Connecting to Git server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    git checkout $_gitbranch

    msg "Git checkout done."
    msg "Starting make..."

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../$_gitname \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4

    make
}

package() {
    cd "$srcdir/build"

    make DESTDIR="$pkgdir" install

    # /usr/share/apps/kdevappwizard/templates/qmake_qt4guiapp.tar.bz2 is
    # already in kdesdk-kapptemplate
    rm "$pkgdir/usr/share/apps/kdevappwizard/templates/qmake_qt4guiapp.tar.bz2"
}
