# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=luagl
pkgver=1.9
pkgrel=1
pkgdesc="OpenGL binding for Lua"
arch=('i686' 'x86_64')
url="http://luagl.sourceforge.net"
license=('custom:MIT')
depends=('lua' 'glu' 'libxmu')
source=("http://downloads.sourceforge.net/project/luagl/$pkgver/Docs%20and%20Sources/luagl-${pkgver}_Sources.tar.gz")
md5sums=('a75681475dddc941c12a3518fd1930f1')

prepare() {
  cd $pkgname

  # build just lua52 modules
  sed -i '/USE_LUA51/d' src/Makefile
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname

  # libs
  install -d "$pkgdir/usr/lib"
  install -Dm755 lib/*/*.so "$pkgdir/usr/lib"

  # links
  install -d "$pkgdir/usr/lib/lua/5.2"
  ln -s /usr/lib/libluagl52.so "$pkgdir/usr/lib/lua/5.2/luagl.so"
  ln -s /usr/lib/libluaglu52.so "$pkgdir/usr/lib/lua/5.2/luaglu.so"

  # headers
  install -d "$pkgdir/usr/include"
  install -Dm644 include/* "$pkgdir/usr/include"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
}
