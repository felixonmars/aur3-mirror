# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-oauth
pkgver=0.0.2
pkgrel=1
pkgdesc="A OAuth client library for Lua"
license=('MIT')
arch="any"
url="https://github.com/ignacio/LuaOAuth"
depends=('lua' 'luasocket' 'luasec' 'luacrypto' 'lua-base64')
source=($url/tarball/v$pkgver)
md5sums=('9959029c782845fb452e40c733654814')

build() {
  cd "$srcdir"
  cd `find -name ignacio*`
  install -Dm0644 src/OAuth.lua \
    $pkgdir/usr/share/lua/5.1/OAuth/init.lua
  install -Dm0644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
