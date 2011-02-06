pkgname=luagl-bin
pkgver=1.6
pkgrel=4
pkgdesc="LuaGL is a library that provides access to all of the OpenGL funcionality from Lua script language."
url="http://luagl.sourceforge.net"
depends=('lua' 'glut')
arch=('i686' 'x86_64')
license="MIT"
[ "${CARCH}" = 'x86_64' ] && _arch='_64'
source=("http://downloads.sourceforge.net/project/luagl/1.6/luagl-1.6_Linux26g4${_arch}_lib.tar.gz?r=&ts=1294592325&use_mirror=mesh")
md5sums=('69cd839a4f89d66f40766e95d670d3fb')
[ "${CARCH}" = 'x86_64' ] && md5sums=('b7de99f7f1e0d3b9126854b7422b7015')

build() {
	cd "$srcdir"
	install -Dm755 libluagl.a $pkgdir/usr/lib/lua/5.1/luagl.a
	install -Dm755 libluagl.so $pkgdir/usr/lib/lua/5.1/luagl.so
	install -Dm755 libluaglu.a $pkgdir/usr/lib/lua/5.1/luaglu.a
	install -Dm755 libluaglu.so $pkgdir/usr/lib/lua/5.1/luaglu.so
	
	install -Dm644 include/luagl.h $pkgdir/usr/include/luagl.h
	install -Dm644 include/luaglu.h $pkgdir/usr/include/luaglu.h
	
	cd $pkgdir/usr/lib/
	ln -s lua/5.1/luagl.so libluagl.so
	}
