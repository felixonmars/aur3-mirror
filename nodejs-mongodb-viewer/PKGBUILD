# Author: Edward Hotchkiss
# Contributor: Edward Hotchkiss
# Contributor: Max Presman <max@presman.ca>
# Maintainer: edwardhotchkiss <e@ingk.com>
_npmname=mongodb-viewer
pkgname=nodejs-mongodb-viewer # All lowercase
pkgver=0.1.5
pkgrel=1
pkgdesc="Node.JS MongoDB web-based admin/viewer tool"
arch=(any)
url="http://edwardhotchkiss.github.com/mongodb-viewer"
license=(MIT)
depends=(nodejs)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(492f733829a53c9940378fe6872162c4df0ddcbc)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
