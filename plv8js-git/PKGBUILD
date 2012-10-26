pkgname=plv8js-git
pkgver=20121026
pkgrel=1
pkgdesc="plv8js is a procedural language add-on for PostgreSQL"
arch=('i686' 'x86_64')
license=('BSD new')
depends=('postgresql' 'v8')
makedepends=('git')
url="http://code.google.com/p/plv8js/"

_gitroot="https://code.google.com/p/plv8js/"
_gitname="plv8js"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
    else
        git clone $_gitroot $_gitname
    fi

    msg "Building plv8js...."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  DESTDIR=$pkgdir make install
}

