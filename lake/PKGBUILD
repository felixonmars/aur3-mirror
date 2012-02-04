# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lake
pkgver=1.1
pkgrel=1
pkgdesc="A Lua-based Build Tool"
arch="any"
url="https://github.com/stevedonovan/Lake"
license=('MIT')
depends=('lua' 'luafilesystem')
provides=('lake')

source=("$url/tarball/$pkgver")
md5sums=('f2977094dde8de2360744fe89a15a8af')

package() {
  cd "$srcdir"
  cd `find -name stevedonovan*`
  install -Dm0775 lake.lua \
    $pkgdir/usr/bin/lake.lua
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -Dm0664 doc/* \
    $pkgdir/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
