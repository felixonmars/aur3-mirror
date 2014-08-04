# Maintainer: Florian Hahn <flo@fhahn.com>

pkgname=lua-cmsgpack
pkgdesc='A self contained Lua MessagePack C implementation.'
license=('BSD')
pkgver=0.r36.f44f954
pkgrel=1
depends=('lua')
makedepends=('git' 'gcc')
conflicts=('lua-cmsgpack')
provides=('cmsgpack')
arch=('i686' 'x86_64')
url='https://github.com/antirez/lua-cmsgpack'
source=('git+https://github.com/antirez/lua-cmsgpack.git')
md5sums=('SKIP')

_gitname=lua-cmsgpack

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    gcc -O2 -fPIC -I/usr/include -c lua_cmsgpack.c -o lua_cmsgpack.o
    gcc -shared -o cmsgpack.so -L/usr/lib lua_cmsgpack.o
}

package() {
    cd "${srcdir}/${_gitname}/"
    install -Dm644 cmsgpack.so "${pkgdir}/usr/lib/lua/5.2/cmsgpack.so"
}
