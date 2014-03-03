# Maintainer: Vivien Didelot <vivien+aur@didelot.org>
_ghuser=vivien
pkgname=i3blocks
pkgver=1.0
pkgrel=1
pkgdesc='Define blocks for your i3bar status line'
arch=('any')
url="https://github.com/$_ghuser/$pkgname"
license=('GPL3')
source=("https://github.com/$_ghuser/$pkgname/archive/$pkgver.tar.gz")
md5sums=('1332a8f8eec869d16fc1beb75399787b')

build () {
  make -C "$srcdir/$pkgname-$pkgver" PREFIX=/usr
}

package () {
  make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: et ts=2 sw=2
