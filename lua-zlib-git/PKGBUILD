# Maintainer: Dwayne Bent <dbb.1@liqd.org>

pkgname=lua-zlib-git
pkgver=20100218
pkgrel=1
url="http://github.com/brimworks/lua-zlib"
pkgdesc='Simple streaming interface to zlib for Lua.'
arch=('i686' 'x86_64')
license=('MIT')
provides=('lua-zlib')
depends=('lua' 'zlib')
makedepends=('git')
source=('Makefile')
md5sums=('643265eefdeadf60bd8e4848266a3ef6')

_giturl='git://github.com/brimworks/lua-zlib.git'
_gitlocal='lua-zlib'

build() {
    _getsrc || return 1
    
    mkdir -p "$pkgdir/usr/lib/lua/5.1/"
    mkdir -p "$pkgdir/usr/share/licenses/lua-zlib"

    make SRCDIR="$srcdir/$_gitlocal" DESTDIR="$pkgdir" install
    install -m644 "$srcdir/$_gitlocal/README" "$pkgdir/usr/share/licenses/lua-zlib/README"
}

_getsrc() {
    if [ -d $_gitlocal ]; then
        msg "Updating source files..."
        pushd $_gitlocal && git pull origin && popd || return 1
    else
        msg "Cloning source files..."
        git clone --depth 1 $_giturl $_gitlocal || return 1
    fi
}
