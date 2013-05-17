# Mantainer: mosra <mosra@centrum.cz>

pkgname=kdevelop-ruby-git
pkgver=20130517
pkgrel=1
pkgdesc="Ruby language plugin for KDevelop - Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform-git')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git' 'bison')
provides=('kdevelop-ruby')
conflicts=('kdevelop-ruby')

_gitroot="git://anongit.kde.org/kdev-ruby"
_gitname="ruby"

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
