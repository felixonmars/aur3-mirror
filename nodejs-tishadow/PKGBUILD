# Author: David Bankier <david@yydigital.com> (http://www.yydigital.com)
# Maintainer: dbankier <bankierd@gmail.com>
_npmname=tishadow
pkgname=nodejs-$_npmname
pkgver=2.5.6
pkgrel=1
pkgdesc="Quick Titanium previews across devices"
arch=(any)
url="https://github.com/dbankier/TiShadow"
license=(Apache Public License v2)
depends=('nodejs')
install=nodejs-tishadow.install

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --ignore-scripts --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
