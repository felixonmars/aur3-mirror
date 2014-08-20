# Maintainer: ceclinux <src655@gmail.com>
# Contributor: ceclinux <src655@gmail.com>

_npmname=douban.fm
_npmver=0.2.2

pkgname=nodejs-doubanfm
pkgver=0.2.2
pkgrel=1
pkgdesc="a tiny and smart cli player of douban.fm based on Node.js"
arch=('any')
url="git+https://github.com/turingou/douban.fm"
license=('MIT')
depends=('python2' 'nodejs' 'git' 'alsa-lib')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=("ca8ea310fac8c913f72b9e44c9f11187")
package() {
    npm config set python /bin/python2.7
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

