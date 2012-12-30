# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=rcs-fast-export
pkgver=0.2.7
pkgrel=2
pkgdesc="Provides a fast-export stream for RCS repositories."
arch=('any')
url="http://git.oblomov.eu/rcs-fast-export"
license=('unknown')
depends=('ruby')
source=(http://git.oblomov.eu/rcs-fast-export/snapshot/f2160f0a5f48424eb1b5d7a8292f814b293191ec.tar.gz)
sha256sums=('ab66d246f57b687034c8ea9a4870026de4d6d1c2d855b5c921236bd84a398dfa')

package() {
  cd "$srcdir/$pkgname-f2160f0"

  install -Dm755 rcs-fast-export.rb "$pkgdir/usr/bin/rcs-fast-export"
}

# vim:set ts=2 sw=2 et:
