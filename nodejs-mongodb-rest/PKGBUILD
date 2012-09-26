# Author: Tom de Grunt <tom@degrunt.nl>
# Contributor: Tom de Grunt <tom@degrunt.nl>
# Contributor: Benjamín Eidelman
# Contributor: Samyak Bhuta
# Maintainer: tdegrunt <tom@degrunt.nl>
_npmname=mongodb-rest
pkgname=nodejs-mongodb-rest # All lowercase
pkgver=0.9.0
pkgrel=1
pkgdesc="REST API Server for MongoDB"
arch=(any)
url="http://github.com/tdegrunt/mongodb-rest"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(119ec2761a19c3a87b6c1120020aebae75dc44eb)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: