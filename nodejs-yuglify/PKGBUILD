# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

_npmname=yuglify
pkgname=nodejs-$_npmname
pkgver=0.1.4
pkgrel=1
pkgdesc="cli wrapper for uglify and cssmin used by YUI"
arch=(any)
url="https://github.com/yui/yuglify/"
license=('BSD')
depends=('nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('521e87877f1ca9470e885dc276548ff6')

package() {
  cd "$srcdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}

# vim:set ts=2 sw=2 et:
