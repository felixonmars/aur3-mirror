# Author: Vytautas Jakutis <vytautas@jakut.is> (http://jakut.is/)
# Maintainer: tahu <vytautas@jakut.is>
_npmname=npmedge
pkgname=nodejs-npmedge # All lowercase
pkgver=0.1.1
pkgrel=1
pkgdesc="Lists packages whose latest available version does not satisfy the specification in package.json"
arch=(any)
url="https://jakut.is/git/NPMEDGE/about/"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(5fa3c70b1425548c1c40d124cc5c973c9d495a7c)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: