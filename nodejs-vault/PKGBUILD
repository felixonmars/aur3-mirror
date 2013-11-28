# Maintainer: Tasos Latsas <tlatsas@gmx.com>
pkgname=nodejs-vault
_npmname=vault
pkgver=0.3.0
pkgrel=1
pkgdesc="Generates safe passwords so you never need to remember them"
arch=(any)
url="https://github.com/jcoglan/vault"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgber.tgz)

package() {
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}


sha256sums=(776d033a2aab42378a82c1ea33a7f98132b927a75bf5c8a5a3cfc48a71e50a1c)
