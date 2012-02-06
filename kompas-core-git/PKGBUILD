# Author: mosra <mosra@centrum.cz>
pkgname=kompas-core-git
pkgver=20120206
pkgrel=1
pkgdesc="Core library for Kompas navigation software (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/kompas.php"
license=('LGPLv3')
depends=('corrade')
makedepends=('cmake' 'git')
provides=('kompas-core')
conflicts=('kompas-core')

_gitroot="git://github.com/mosra/kompas-core.git"
_gitname="kompas-core"

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
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
