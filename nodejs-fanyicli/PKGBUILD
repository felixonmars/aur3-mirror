# Contrintainer: ceclinux <src655@gmail.com>
# Contributor: ceclinux <src655@gmail.com>

_npmname=fanyi
_npmver=0.2.3

pkgname=nodejs-fanyicli
pkgver=0.2.3
pkgrel=1
pkgdesc="A translate tool in your command line"
arch=('any')
url="https://github.com/afc163/fanyi"
license=('MIT')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=("7fafb7e1e3e07f2eb3a68c4d8a546a62")
package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

