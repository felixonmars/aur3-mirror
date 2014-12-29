# maintainer: perlawk

pkgname="luautf8"
pkgver="1.0"
pkgrel=1
pkgdesc="A utf8-module for 5.x and luajit"
arch=('i686' 'x86_64')
url="https://github.com/starwing/luautf8"
license=('MIT')
depends=('lua')
provides=()
conflicts=()
source=("https://github.com/starwing/luautf8/archive/master.zip")

md5sums=('f9c9fe940acdeed39b195476c82a276a')

prepare() {
  cd $srcdir/luautf8-master
	sed -e 's!<lua!<lua5.1/lua!g; s!<laux!<lua5.1/laux!g;' lutf8lib.c > u8.c
}

build() {
  cd $srcdir/luautf8-master
  mkdir -p 5.1 5.2
	gcc -O2 -o utf8.so -fpic -shared u8.c 
	cp utf8.so 5.1
	gcc -O2 -o utf8.so -fpic -shared lutf8lib.c 
	cp utf8.so 5.2
}
  
package() {
  cd $srcdir/luautf8-master
  mkdir -p $pkgdir/usr/lib/lua/5.1
  mkdir -p $pkgdir/usr/lib/lua/5.2
  cp 5.1/utf8.so $pkgdir/usr/lib/lua/5.1
  cp 5.2/utf8.so $pkgdir/usr/lib/lua/5.2
}
