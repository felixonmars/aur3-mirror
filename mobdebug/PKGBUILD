# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
pkgname=mobdebug
pkgver=0.55
pkgrel=1
pkgdesc="Remote debugger for Lua. Based on RemDebug, but with a new set of features"
arch=('any')
url="https://github.com/pkulchenko/MobDebug"
license=('MIT')
depends=('luasocket-git')
source=(https://github.com/pkulchenko/MobDebug/archive/$pkgver.tar.gz mobdebug.install mobdebug-server.sh)
install="mobdebug.install"
md5sums=('02133feeac5d566d7c7452e60d2ca6af'
         '26c5cf7504936ef6ddfccd632bebfa28'
         '84ae54b79d1add49511ff30ebaddbf15')

package() {
  cd "$srcdir"
  install -Dm755 mobdebug-server.sh "$pkgdir/usr/bin/mobdebug-server"

  cd "$srcdir/MobDebug-$pkgver"
  install -Dm644 src/mobdebug.lua "$pkgdir/usr/share/lua/5.2/mobdebug.lua"
  install -Dm644 README "$pkgdir/usr/share/doc/mobdebug/README.md"
  cp -r examples/ "$pkgdir/usr/share/doc/mobdebug/"
}

# vim:set ts=2 sw=2 et:
