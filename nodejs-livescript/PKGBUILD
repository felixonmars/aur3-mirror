# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

_npmname=LiveScript
pkgname=nodejs-livescript
pkgver=1.2.0
pkgrel=1
pkgdesc="LiveScript is a language which compiles to JavaScript"
arch=(any)
url="http://livescript.net/"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('a6e824e89a4205dbe33d5e7f4e50932c')

package() {
  cd "$srcdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}

# vim:set ts=2 sw=2 et:
