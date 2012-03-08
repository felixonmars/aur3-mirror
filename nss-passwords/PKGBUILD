# Maintainer: Nicolas Estibals <Nicolas.Estibals@gmail.com>
pkgname=nss-passwords
pkgver=0.1.1
pkgrel=1
pkgdesc="Reads passwords from a Mozilla keyring from command-line."
arch=('i686' 'x86_64')
url="https://github.com/glondu/nss-passwords"
license=('GPL')
options=('!strip')
depends=('nss' 'ocaml' 'ocaml-fileutils' 'ocaml-sqlite3' 'pinentry')
makedepends=('ocaml-findlib')
source=(https://github.com/downloads/glondu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0b3c4b81efa48a7ea4e73115d6f0cf6d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
