# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Hoang Duc Hieu <hdh@lazny.tang.la>

pkgname=ivan-git
pkgver=1407.4abe99e
pkgrel=2
epoch=1
pkgdesc="A tile-graphics roguelike with limb dismembering -- Fork with x86_64 support"
arch=(i686 x86_64)
url="http://gitorious.org/ivan#more"
license=('GPL2')
depends=(boost sdl)
options=(emptydirs)
makedepends=(git)
provides=(ivan)
conflicts=(ivan)
source=(git+http://git.gitorious.org/ivan/ivan.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ivan"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ivan"

  ./waf -p configure --prefix=/usr
}

package() {
  cd "$srcdir/ivan"

  ./waf install --destdir="$pkgdir"

  mkdir -p "$pkgdir/usr/share/ivan/state"
  chmod g+w "$pkgdir/usr/share/ivan/state"
  chgrp games "$pkgdir/usr/bin/ivan" "$pkgdir/usr/share/ivan/state"
  chmod g+s "$pkgdir/usr/bin/ivan"
}

# vim:set ts=2 sw=2 et:
