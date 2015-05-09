# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-xgettext-template
_npmname=xgettext-template
pkgver=2.0.3
pkgrel=1
pkgdesc="Extract translatable strings from templates"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/gmarty/xgettext"
license=('MIT')
provides=('xgettext-template' 'nodejs-xgettext-template')
conflicts=('xgettext-template')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
