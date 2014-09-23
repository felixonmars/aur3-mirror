# Author: Felix Gnass
# Maintainer: uwinkelvos <ulf@winkelvos.de>
_npmname=node-dev
pkgname=nodejs-node-dev # All lowercase
pkgver=2.1.6
pkgrel=1
pkgdesc="Restarts your app when files are modified"
arch=(any)
url="http://github.com/fgnass/node-dev"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha1sums=('e7788eeaa97d58b46a8e366e60c7329e9e69fca9')
