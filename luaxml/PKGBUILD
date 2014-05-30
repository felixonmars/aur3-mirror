# Maintainer: Baurzhan Muftakhidinov <baurthefirst at gmail dot com>
# Contributor: hauptmech <hauptmech at gmail>

pkgname=luaxml
_pkgname=LuaXML
pkgver=130610
pkgrel=1
pkgdesc='a module that maps between Lua and XML without much ado'
arch=('i686' 'x86_64')
url=("http://viremo.eludi.net/LuaXML/index.html")
license=('MIT')
depends=('lua')
source=("http://viremo.eludi.net/${_pkgname}/${_pkgname}_${pkgver}.zip" "LICENSE.txt")

build() {
  install -Dm0644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  cd $srcdir
	make all || return 1

#  install -Dm0755 LuaXML_lib.o $pkgdir/usr/lib/lua/5.1
  install -Dm0755 LuaXML_lib.so $pkgdir/usr/lib/lua/5.2/LuaXML_lib.so
  install -Dm0644 LuaXml.lua $pkgdir/usr/share/lua/5.2/LuaXml.lua
}

md5sums=('25e4c276c5d8716af1de0c7853aec2b4'
         'f3b01eead195026893ca88566be3d5bb')
