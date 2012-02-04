# Maintainer: Dwayne Bent <dbb.1@liqd.org>

pkgname=lua-cyrussasl-git
pkgver=20100215
pkgrel=1
pkgdesc="Lua bindings for Cyrus SASL library."
arch=('i686' 'x86_64')
url="http://github.com/JorjBauer/lua-cyrussasl"
license=('BSD')
depends=('lua>=5.1' 'libsasl')
makedepends=('git')
provides=('lua-cyrussasl')
source=("lua-cyrussasl.patch")
md5sums=('5b5c15e4cba63d05a5bfd1cc3ddcba0f')

_giturl='git://github.com/JorjBauer/lua-cyrussasl.git'
_gitlocal='lua-cyrussasl'

build() {
    _getsrc || return 1

    cd $_gitlocal

    mkdir -p "$pkgdir/usr/lib/lua/5.1" || return 1
    mkdir -p "$pkgdir/usr/share/licenses/lua-cyrussasl" || return 1

    patch -p1 < "$srcdir/lua-cyrussasl.patch" || return 1
	make DESTDIR=${pkgdir} install || return 1

    install -m644 "LICENSE" "$pkgdir/usr/share/licenses/lua-cyrussasl/LICENSE"
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
