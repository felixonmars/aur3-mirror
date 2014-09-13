# Contrintainer: ceclinux <src655@gmail.com>
# Contributor: ceclinux <src655@gmail.com>

_npmname=etymology-cli
_npmver=0.0.5

pkgname=nodejs-etymologycli
pkgver=0.0.5
pkgrel=1
pkgdesc="To explain what our words meant and how they sounded 600 or 2,000 years ago."
arch=('any')
url="https://github.com/ceclinux/node-etymologycli"
license=('MIT')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=("25d569b51a77a101003670f9a1e866ad")
package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
