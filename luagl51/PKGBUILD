# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=luagl51
pkgver=1.9
pkgrel=1
pkgdesc="OpenGL binding for Lua 5.1"
arch=('i686' 'x86_64')
url="http://luagl.sourceforge.net"
license=('custom:MIT')
depends=('lua51' 'glu' 'libxmu')
source=("http://downloads.sourceforge.net/project/luagl/$pkgver/Docs%20and%20Sources/luagl-${pkgver}_Sources.tar.gz")
md5sums=('a75681475dddc941c12a3518fd1930f1')

prepare() {
  cd luagl

  # build just lua51 modules
  sed -i '/USE_LUA52/d' src/Makefile
}

build() {
  cd luagl
  LUA_INC=/usr/include/lua5.1 \
  make
}

package() {
  cd luagl

  # libs
  install -d "$pkgdir/usr/lib"
  install -Dm755 lib/*/*.so "$pkgdir/usr/lib"

  # links
  install -d "$pkgdir/usr/lib/lua/5.1"
  ln -s /usr/lib/libluagl51.so "$pkgdir/usr/lib/lua/5.1/luagl.so"
  ln -s /usr/lib/libluaglu51.so "$pkgdir/usr/lib/lua/5.1/luaglu.so"

  # headers
  install -d "$pkgdir/usr/include/lua5.1"
  install -Dm644 include/* "$pkgdir/usr/include/lua5.1"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
}
