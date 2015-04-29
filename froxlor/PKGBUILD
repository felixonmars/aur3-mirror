# Maintainer: "Das" Franck Hochstaetter <dasfranck@gmx.com>

pkgname=froxlor
pkgver=0.9.33.1
pkgrel=1
pkgdesc="A small, but powerful PHP-based server control panel. Runs with apache2 or lighttpd."
arch=(any)
url="http://www.froxlor.org"
license=('GPL')
depends=('php' 'mysql')
source=(http://files.froxlor.org/releases/$pkgname-latest.tar.gz)
md5sums=('19c23229813c4b78d9a814540ce6882c')

package() {
  mkdir -p "$pkgdir/var/www/froxlor"
  cp -r "$srcdir/$pkgname" "$pkgdir/var/www/"
} 

