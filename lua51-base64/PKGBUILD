# Contributer: Linus Sjögren <thelinx@unreliablepollution.net>
# Maintainer: Steven Allen <steven {at} stebalien {dot} com>

pkgname=lua51-base64
pkgver=20120820
pkgrel=1
pkgdesc="A base64 library for Lua."
license=('custom:Public Domain')
arch=('x86_64' 'i686')
url="http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lbase64"
depends=('lua51')
source=('http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1/lbase64.tar.gz')
md5sums=('4834045fe79facef524990e968783dab')

_luabin="$(pkg-config lua5.1 --variable INSTALL_BIN)"
_luainc="$(pkg-config lua5.1 --variable INSTALL_INC)"
_lualib="$(pkg-config lua5.1 --variable INSTALL_LIB)"
_luacmod="$(pkg-config lua5.1 --variable=INSTALL_CMOD)"


build() {
    cd "$srcdir/base64"

    if [ $CARCH = x86_64 ]; then
        G=-fPIC
    fi

    make so G=$G LUALIB=$_lualib LUABIN=$_luabin LUAINC=$_luainc
}

check() {
    cd "$srcdir/base64"
    lua5.1 test.lua
}

package() {
    cd "$srcdir/base64"
    install -Dm755 base64.so "$pkgdir/$_luacmod/base64.so"
}
