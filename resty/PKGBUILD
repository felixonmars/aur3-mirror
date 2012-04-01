# Maintainer: Pierre Carrier <pierre@spotify.com>
pkgname=resty
pkgver=2.2
pkgrel=1
pkgdesc="A tiny command line REST interface for bash and zsh"
arch=(any)
url="https://github.com/micha/resty"
license=('custom:No rights reserved')
source=(https://raw.github.com/micha/$pkgname/$pkgver/$pkgname)
md5sums=('a16261c9b8d73b264c079e6d21a263f5')

package() {
  cd "$srcdir/"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
