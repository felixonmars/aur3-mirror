# Author: Filirom1
# Maintainer: Filirom1 <filirom1@gmail.com>
# Maintainer: filirom1 <filirom1@gmail.com>
_npmname=no-build-conf
pkgname=nodejs-no-build-conf # All lowercase
pkgver=0.5.3
pkgrel=1
pkgdesc="Stop configuring your assets pipeline. Everything is in the HTML. The build script just read your index.html."
arch=(any)
url="https://github.com/Filirom1/no-build-conf-build-script"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(2be66eda1d75add05c9f64bc56c9522d46ddf633)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: