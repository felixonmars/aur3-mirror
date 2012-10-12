# Author: wookiehangover <sam@quickleft.com>
# Contributor: filirom1 <filirom1@gmail.com>
# Maintainer: Filirom1 <filirom1@gmail.com>
# Maintainer: wookiehangover <sam@quickleft.com>
# Maintainer: filirom1 <filirom1@gmail.com>
_npmname=universal-jst
pkgname=nodejs-universal-jst # All lowercase
pkgver=1.0.4
pkgrel=1
pkgdesc="Pre-compiled JavaScript Templates"
arch=(any)
url="https://github.com/wookiehangover/handlebars-jst"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(b08858990e22ef9c1e33a9fa646547173ba46a5f)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: