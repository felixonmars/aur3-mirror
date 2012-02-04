# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=omoma
pkgver=0.2
pkgrel=1
pkgdesc="A financial web application"
arch=('any')
url="http://code.google.com/p/omoma/"
license=('GPL3')
depends=('python2' 'django' 'libofx')
source=(http://omoma.googlecode.com/files/$pkgname-$pkgver.zip)
md5sums=('7d9508cb17b7ebf2e927a553c896b9f3')
install=$pkgname.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #clean .svn files
  find "$srcdir/$pkgname-$pkgver" -depth -name ".svn" -exec rm -rf {} \;

  #python mean python2

  sed -i 's!/usr/bin/python!/usr/bin/python2!' $pkgname/manage.py

  install -d "$pkgdir/srv/http/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/srv/http/"

}

# vim:set ts=2 sw=2 et:
