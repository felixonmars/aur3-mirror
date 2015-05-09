# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-gettext-handlebars
_npmname=gettext-handlebars
pkgver=0.2.2
pkgrel=1
pkgdesc="Extract translatable strings from Handlebars templates"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/smhg/gettext-handlebars"
license=('MIT')
provides=('gettext-handlebars' 'nodejs-gettext-handlebars')
conflicts=('gettext-handlebars')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
