# Maintainer: Philipp Gesang <megas dot kapaneus at gmail dot com>
pkgname=slnunicode
pkgver=1.1
pkgrel=1
pkgdesc="Unicode-aware replacement for the Lua string library from the Selene database."
arch=("any")
url="http://luaforge.net/projects/sln/"
license=("custom")
depends=("lua")
source=("http://luaforge.net/frs/download.php/1693/${pkgname}-${pkgver}.tar.bz2"
        "patch_slnunicode.diff" # http://lua-users.org/lists/lua-l/2008-02/msg00043.html
        "LICENSE")
md5sums=('6cb97097b6a61e4232701dcd7948847c'
         '60426d3101bd0c4dca4d05333d75f9ec'
         '18ad94b36b198743a0142b3ada1411d7')

build() {
    cp ./patch_slnunicode.diff "${srcdir}/${pkgname}-${pkgver}/patch_slnunicode.diff"
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p0 < ./patch_slnunicode.diff
    gcc -O2 -fPIC -I/usr/include -c slnunico.c -o ./slnunico.o
    gcc -O2 -fPIC -I/usr/include -c slnudata.c -o ./slnudata.o
    gcc -shared -o unicode.so -L/usr/lib slnunico.o ./slnudata.o
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/unicode.so" "${pkgdir}/usr/lib/lua/5.1/unicode.so"
    install -Dm0644 "${srcdir}/LICENSE"                         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
