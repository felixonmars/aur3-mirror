# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-handlebars-xgettext
_npmname=handlebars-xgettext
pkgver=1.4.2
pkgrel=1
pkgdesc="Extract strings from Handlebars source"
arch=('any')
depends=('nodejs')
url="https://github.com/gmarty/handlebars-xgettext"
license=('MIT')
provides=('handlebars-xgettext' 'nodejs-handlebars-xgettext')
conflicts=('handlebars-xgettext')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
