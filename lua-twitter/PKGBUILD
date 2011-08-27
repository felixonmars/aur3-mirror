# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-twitter
pkgver=1.0.0
pkgrel=1
pkgdesc="A Twitter API wrapper for Lua."
license=('custom:CC0')
arch="any"
url="https://github.com/TheLinx/ltwitter"
depends=('lua>=5.1' 'luajson' 'lua-oauth')
source=($url/tarball/$pkgver)
md5sums=('a3054a687249aa06553a4bcb8d14ed1a')

build() {
  cd "$srcdir"
  cd `find -name TheLinx*`
  install -Dm0644 twitter/init.lua \
    $pkgdir/usr/share/lua/5.1/twitter/init.lua
  install -Dm0644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
