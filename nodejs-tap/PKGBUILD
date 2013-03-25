# Author: Isaac Z. Schlueter <i@izs.me> (http://blog.izs.me)
# Contributor: Isaac Z. Schlueter <i@izs.me> (http://blog.izs.me)
# Contributor: baudehlo <helpme+github@gmail.com>
# Maintainer: isaacs <i@izs.me>
_npmname=tap
pkgname=nodejs-tap # All lowercase
pkgver=0.4.1
pkgrel=1
pkgdesc="A Test-Anything-Protocol library"
arch=(any)
url="http://github.com/isaacs/node-tap"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(03a5979da2b349395b11b6add17b06a7c438730b)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: