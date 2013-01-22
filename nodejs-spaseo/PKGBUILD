# Author: Filirom1 <filirom1@gmail.com>
# Maintainer: filirom1 <filirom1@gmail.com>
_npmname=spaseo
pkgname=nodejs-spaseo # All lowercase
pkgver=0.3.4
pkgrel=1
pkgdesc="Make your Single Page Web Application (SPA) readable by Search Engines (SEO). Only works with pushState."
arch=(any)
url="https://Filirom1@github.com/Filirom1/spaseo"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(b9ecb7047c325310d4c183090060353b3f5eaeeb)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: