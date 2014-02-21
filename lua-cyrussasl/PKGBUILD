# Maintainer: Bidossessi Sodonon <bsodonon@linuxbenin.com>

pkgname=lua-cyrussasl
pkgver=1.0.0
pkgrel=3
pkgdesc="Lua bindings for Cyrus SASL library."
arch=('i686' 'x86_64')
url="http://github.com/JorjBauer/lua-cyrussasl"
license=('BSD')
depends=('lua>=5.1' 'libsasl')
source=(
    "lua-cyrussasl-$pkgver.tar.gz::https://github.com/JorjBauer/lua-cyrussasl/tarball/v$pkgver"
    "lua-cyrussasl.patch"
    "cyrussasl.patch"
)

build() {
    cd $srcdir/*-lua-cyrussasl-*

    patch -p1 < "$srcdir/lua-cyrussasl.patch"
    patch -p1 < "$srcdir/cyrussasl.patch"
	make
}

package() {
    mkdir -p "$pkgdir/usr/lib/lua/5.1"
    mkdir -p "$pkgdir/usr/share/licenses/lua-cyrussasl"
	
    cd $srcdir/*-lua-cyrussasl-*
    
    make DESTDIR=${pkgdir} install
    install -m644 "LICENSE" "$pkgdir/usr/share/licenses/lua-cyrussasl/LICENSE"
}
md5sums=('40c94c06441e1e47640d81b125742969'
         '4841499be44f14f6083c68cc552f694d'
         '26d76e247f1494cf8dd42f2934d45942')
