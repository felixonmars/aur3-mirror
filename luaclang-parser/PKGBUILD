# maintainer: perlawk

pkgname=luaclang-parser
pkgver=1.0
pkgrel=2
pkgdesc="A Lua binding to the libclang library, which allows you to parse C and C++ code using the Clang compiler."
arch=('i686' 'x86_64')
url="https://github.com/mkottman/luaclang-parser"
license=('MIT')
depends=('lua' 'lua51' 'luasql' 'clang')
options=()
source=("https://github.com/mkottman/luaclang-parser/archive/master.zip" 'define')

build() {
    cd ${pkgname}-master
		mkdir 5.1 5.2 -p
		g++ -fpic -shared -o 5.1/luaclang-parser.so luaclang-parser.cpp -lclang -llua5.1 -I/usr/include/lua5.1	
		cat $srcdir/define luaclang-parser.cpp > 5.2/luaclang-parser.cpp 
		g++ -fpic -shared -o 5.2/luaclang-parser.so 5.2/luaclang-parser.cpp -lclang -llua
}

package() {
    cd ${pkgname}-master
		loc="$pkgdir"/usr/lib/lua/5.
		mkdir -p "$loc"1 "$loc"2
		cp 5.1/luaclang-parser.so "$loc"1
		cp 5.2/luaclang-parser.so "$loc"2
}
md5sums=('SKIP'
         'da32f8d7849f20bf895461a86e499940')
