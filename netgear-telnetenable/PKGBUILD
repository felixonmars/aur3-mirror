# Maintainer: Chris Brannon <chris@the-brannons.com>
pkgname=netgear-telnetenable
pkgver=0.1
pkgrel=1
pkgdesc="Enable the telnet console on certain models of Netgear routers"
arch=(any)
url="http://$pkgname.googlecode.com"
license=('MIT')
depends=(python2 pycrypto)
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.zip
        LICENSE)
md5sums=('14f62221c9e47271feedb8b4eeec817e'
         '44cae9b93a698858c577a9f6d92d5495')

build() {
  cd "$srcdir"
  sed -i -e '1i#!/usr/bin/env python2' telnetenable.py
}

package() {
  cd "$srcdir"

  install -Dm755 telnetenable.py "$pkgdir/usr/bin/telnetenable.py"
  install -Dm644 Readme.txt "$pkgdir/usr/share/doc/$pkgname/Readme.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
