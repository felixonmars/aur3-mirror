# Author: Zach Carter <zach@carter.name> (http://zaa.ch)
# Maintainer: zaach <zack.carter@gmail.com>
_npmname=jsonlint
pkgname=nodejs-jsonlint # All lowercase
pkgver=1.5.1
pkgrel=1
pkgdesc="Validate JSON"
arch=(any)
url="http://zaach.github.com/jsonlint/"
license=()
depends=(nodejs)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(3cf436dcc9f3477ef3d7fa55a5bdf6d893f1c6c6)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: