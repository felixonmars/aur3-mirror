# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=(kdevelop-xdebug-git)
pkgver=20130517
pkgrel=1
pkgdesc="XDebug PHP debugger plugin for KDevelop - Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform-git' 'kdevelop-executebrowser-git' 'xdebug')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git')
provides=('kdevelop-xdebug')
conflicts=('kdevelop-xdebug')

_gitroot="git://anongit.kde.org/kdev-xdebug"
_gitname="xdebug"

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
