# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-anyhub
pkgver=1.0.0
pkgrel=3
pkgdesc="A Lua wrapper for the Anyhub API."
license=('custom:CC0')
arch="any"
url="https://github.com/TheLinx/lanyhub"
depends=('lua>=5.1' 'lua-curl')
conflicts=('lua-anyhub-git')
source=(https://github.com/TheLinx/lanyhub/tarball/$pkgver)
md5sums=('4349f5f9af4552a4d2caebf6377d976e')

build() {
  cd "$srcdir"
  cd `find -name TheLinx*`
  install -Dm0644 anyhub/init.lua \
    $pkgdir/usr/share/lua/5.1/anyhub/init.lua
  install -Dm0644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
