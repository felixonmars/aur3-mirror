# Maintainer: Philipp Gesang <phg42.2a@gmail.com>
pkgname=slnunicode-git
_gitname=slnunicode
pkgver=20130703.gf80f1bc
pkgrel=1
pkgdesc="Unicode-aware replacement for the Lua string library from the Selene database."
arch=("any")
url="http://luaforge.net/projects/sln/"
license=("custom")
depends=("lua")
source=("slnunicode::git+https://github.com/phi-gamma/${_gitname}"
        "LICENSE")
md5sums=('SKIP'
         'a0aa54d20e6ebfb863b509e1c20035a5')
options=(!strip)
_gitbranch="master"

pkgver() {
  cd $_gitname
  # Package version is the date of the last commit + the SHA tag
  git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build () {
    cd $_gitname
    gcc -O2 -fPIC -I/usr/include -c slnunico.c -o ./slnunico.o
    gcc -O2 -fPIC -I/usr/include -c slnudata.c -o ./slnudata.o
    gcc -shared -o unicode.so -L/usr/lib slnunico.o ./slnudata.o
}

package () {
    cd $_gitname
    install -Dm0755 "${srcdir}/${_gitname}/unicode.so" "${pkgdir}/usr/lib/lua/5.2/unicode.so"
    install -Dm0644 "${srcdir}/LICENSE"                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
