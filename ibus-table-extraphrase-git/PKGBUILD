# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=ibus-table-extraphrase
pkgname=$_pkgname-git
pkgver=20130127
pkgrel=1
pkgdesc="The extra phrases of tables engines for IBus."
arch=(any)
url=http://code.google.com/p/ibus/
license=(LGPL2.1)
depends=(ibus-table)
makedepends=(git)
provides=($_pkgname=1.3.9)
conflicts=($_pkgname)
options=(!libtool)

_gitroot=git://github.com/acevery/$_pkgname.git
_gitname=$_pkgname

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [[ -d $_gitname/.git ]]; then
        pushd $_gitname && git pull
        msg2 "The local files are updated."
        popd
    else
        git clone --depth 1 $_gitroot
    fi
    msg2 "GIT checkout done or server timeout"

    rm -rf $_gitname-build/
    cp -r $_gitname/ $_gitname-build/
    cd $_gitname-build/

    msg "Building..."
    ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/ibus
    make
}

package() {
    cd "$srcdir"/$_gitname-build/
    make DESTDIR="$pkgdir" install
}
