# Author: Mike Smathers <msmathers@narrativescience.com>
# Contributor: Mike Smathers <msmathers@narrativescience.com>
# Maintainer: msmathers <msmathers@narrativescience.com>
_npmname=log.io
pkgname=nodejs-log.io # All lowercase
pkgver=0.3.4
pkgrel=1
pkgdesc="Realtime log monitoring in your browser"
arch=(any)
url="http://logio.org"
license=('Apache')
depends=('nodejs' )
builddepends=('python2')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(db949ff0fac46b84ae69947b9bf68b9f7a69b1eb)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  export PYTHON=python2
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
