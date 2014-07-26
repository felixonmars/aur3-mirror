# Maintainer: Tobias Wild <borntobiwild at gmail dot com>
_npmname=meanio
pkgname=nodejs-$_npmname
pkgver=0.5.10
pkgrel=1
pkgdesc="Simple command line interface for installing and managing MEAN apps"
arch=('any')
url="http://mean.io/"
license=('MIT')
depends=('nodejs')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('f8ceca026949d70386790d2aae0df8d9')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
