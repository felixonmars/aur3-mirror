# Maintainer: Frank Poehler <fp29129@googlemail.com>
pkgname=tatort-dl
pkgver=20130128
pkgrel=1
pkgdesc="A shell-scripted CLI tool for downloading films from ARD Mediathek (German Television) @ http://www.ardmediathek.de"
arch=(any)
url="http://rg42.org/wiki/tatort-dl"
license=('GPL')
depends=('curl' 'rtmpdump')
source=("$pkgname::http://rg42.org/gitweb/?p=scripts.git;a=blob_plain;f=tatort-dl.sh;hb=HEAD")
install=info.install
sha256sums=('c7f7f76566d8ee7f9e9a0189d594c302e4b9c27df4db837842b9a3cf4f314947')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
