# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-state
pkgver=1.3.3
pkgrel=2
pkgdesc="A library for simple and painless storing of tables in Lua."
license=('custom:Public Domain')
arch="any"
url="https://github.com/TheLinx/lstate"
depends=('lua>=5.1' 'luafilesystem')
conflicts=('lua-state-git')
source=(https://github.com/TheLinx/lstate/tarball/$pkgver)
md5sums=('13bd82aa844b31d95278e54e462473c9')

build() {
  cd "$srcdir"
  cd `find -name TheLinx*`
  install -Dm0644 state/init.lua \
    $pkgdir/usr/share/lua/5.1/state/init.lua
  install -Dm0644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
