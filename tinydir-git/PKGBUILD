# Maintainer: Baudouin FEILDEL <baudouin@feildel.org>

pkgname=tinydir-git
_pkgname=tinydir
pkgver=e45ab48
pkgrel=1
pkgdesc="Lightweight, portable and easy to integrate C directory and file reader"
arch=('any')
url="https://github.com/cxong/tinydir"
license=('Simplified BSD')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git://github.com/cxong/tinydir.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | cut -d '-' -f2- | sed 's/-/.r/;s/[-_]/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  
  mkdir -p "$pkgdir/usr/share/tinydir/samples"
  mkdir -p "$pkgdir/usr/include/"
  
  install -Dm644 samples/* "$pkgdir/usr/share/tinydir/samples"
  install -Dm644 README.md "$pkgdir/usr/share/tinydir/"
  install -Dm644 COPYING   "$pkgdir/usr/share/tinydir/"
  install -Dm644 THANKS    "$pkgdir/usr/share/tinydir/"
  install -Dm644 tinydir.h "$pkgdir/usr/include/tinydir.h"
}
