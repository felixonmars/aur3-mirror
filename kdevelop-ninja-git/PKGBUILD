# Contributor: mosra <mosra@centrum.cz>

pkgname=kdevelop-ninja-git
pkgver=20131025
pkgrel=1
pkgdesc="Ninja build system plugin for KDevelop - Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform-git' 'ninja')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git')

_gitroot="git://anongit.kde.org/kdev-ninja"
_gitname="ninja"

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

    make DESTDIR="$pkgdir" install
}
