pkgname=syck-git
pkgver=20121223
pkgrel=1
pkgdesc="Syck"
arch=('i686' 'x86_64')
url="http://github.com/indeyets/syck"
license=('BSD')
depends=()
makedepends=('git' 're2c')
conflicts=('syck')
source=()
md5sums=()

_gitroot="git://github.com/indeyets/syck.git"
_gitname="syck"

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

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    #
    # BUILD HERE
    #

    ./bootstrap
    ./configure --prefix=/usr/
    # syck can only be build single-threaded
    make -j1 || return 1
    make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
