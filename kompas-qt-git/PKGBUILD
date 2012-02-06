# Author: mosra <mosra@centrum.cz>
pkgname=kompas-qt-git
pkgver=20120206
pkgrel=1
pkgdesc="Qt GUI for Kompas navigation software (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/kompas.php"
license=('LGPLv3')
makedepends=('cmake' 'git')
depends=('kompas-core-git' 'qt')
provides=('kompas-qt')
conflicts=('kompas-qt')

_gitroot="git://github.com/mosra/kompas-qt.git"
_gitname="kompas-qt"

build() {
    cd "$srcdir"
    msg "Connecting to Git server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "Git checkout done."
    msg "Starting make..."

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../$_gitname \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
