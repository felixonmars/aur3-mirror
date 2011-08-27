# Author: mosra <mosra@centrum.cz>
pkgname=heytrack-git
pkgver=20100919
pkgrel=1
pkgdesc="Simple utility for playing internet radio streams with track notification (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/heytrack-en.php"
license=('LGPLv3')
depends=('qt' 'qjson')
makedepends=('git' 'cmake')
optdepends=('kdebase-workspace')
conflicts=('heytrack')
provides=('heytrack')

_gitroot="git://github.com/mosra/heytrack.git"
_gitname="heytrack"

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

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../${_gitname}
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
