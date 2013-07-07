# Maintainer: 
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=ispell-de
pkgver=2.0
pkgrel=1
pkgdesc="German dictionary for ispell"
arch=('any')
url="https://aur.archlinux.org/packages/ispell-de"
license=('unknown')
depends=('ispell')
source=(ftp://ftp.informatik.uni-kiel.de/pub/kiel/dicts/hk2-deutsch.tar.gz)
md5sums=('7fa72ab88d3ef466e35cf0721140b8ec')

build() {
  cd "$srcdir"

  make
}

package() {
  install -Dm644 "$srcdir"/deutsch.aff "$pkgdir"/usr/lib/ispell/deutsch.aff
  install -m644 "$srcdir"/deutsch.hash "$pkgdir"/usr/lib/ispell/deutsch.hash
}
