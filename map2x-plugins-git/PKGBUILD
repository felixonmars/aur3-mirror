# Author: mosra <mosra@centrum.cz>
pkgname=map2x-plugins-git
pkgver=20101017
pkgrel=1
pkgdesc="Plugins for Map2X navigation system (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/map2x.php"
license=('LGPLv3')
makedepends=('cmake' 'git')
depends=('map2x-core-git')
provides=('map2x-plugins')
conflicts=('map2x-plugins')

_gitroot="git://github.com/mosra/map2x-plugins.git"
_gitname="map2x-plugins"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
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
