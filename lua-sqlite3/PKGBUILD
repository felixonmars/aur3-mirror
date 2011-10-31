# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=lua-sqlite3  
pkgver=0.4.1
pkgrel=1 
pkgdesc="Lua-Sqlite3 is unique in contrast to other database bindings that it consists of two layers. The first layer translates the SQLite 3 implementation's C API to Lua. The first layer is called the backend. The second layers are frontend layers, written in Lua. These layers provide a nice and smart view of the database "
url="http://nessie.de/mroth/lua-sqlite3/index.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://nessie.de/mroth/lua-sqlite3/$pkgname-$pkgver.tar.gz)
md5sums=('66db31f6f9744b1976f656b39d6949df')
build() {
  cd $startdir/src/$pkgname-$pkgver
  CFLAGS="-O2 -g -fPIC"  ./configure --prefix=/usr \
	--with-lua-dir=/usr/lib/lua/5.1\
	--with-lua-libdir=/usr/lib/lua/5.1\
	--libexecdir=/usr/lib/lua/5.1
  make || return 1
  make DESTDIR=$startdir/pkg install
	mkdir -p $pkgdir/usr/lib/lua/5.1
	cd $pkgdir/usr/lib/lua
	sed -e 's@"/usr/lib/lua"@"/usr/lib/lua/5.1"@g' libluasqlite3-loader.lua > 5.1/libluasqlite3-loader.lua
	rm libluasqlite3-loader.lua
	mv $pkgdir/usr/lib/lua/*lua* $pkgdir/usr/lib/lua/5.1  
}
