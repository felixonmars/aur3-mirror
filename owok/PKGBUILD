# Maintainer: Adam Hani Schakaki (krzd) <krzd@krzd.net>
pkgname=owok
pkgver=2.0.0.4
pkgrel=1
pkgdesc="Browser plugin for accessing chip cards via the web."
arch=('i686' 'x86_64')
url="http://www.owok.org/"
license=('custom')
depends=('pcsclite')
makedepends=(rpmextract)
source=(http://support.reiner-sct.de/downloads/$pkgname/plugins/$pkgname-$pkgver-0.i386.rpm)
[[ "$CARCH" == "x86_64" ]] && source=(http://support.reiner-sct.de/downloads/$pkgname/plugins/$pkgname-$pkgver-0.x86_64.rpm)
sha256sums=('a4396c372078471aa4699ed471a4da69759ff377fe4ec3b409b59d0228044a9f')
[[ "$CARCH" == "x86_64" ]] && sha256sums=('beb550e66f4dbf6f040ad57bd4b3d696c4dfe8ce4e3050796d5ce2ec1c2aa810')

build() {
  cd "$srcdir"
  rpmextract.sh $pkgname-$pkgver-*.rpm
  install -d -m755 ${pkgdir}/usr/lib/mozilla/plugins/
  install -m755 ${srcdir}/usr/lib/mozilla/plugins/*.so ${pkgdir}/usr/lib/mozilla/plugins/
}

# vim:set ts=2 sw=2 et:
