
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=zomg
pkgver=latest
pkgrel=1
pkgdesc="Command-line music player with last.fm support"
url="http://zomg.alioth.debian.org"
arch=(i686)
license=('GPL')
depends=(zsh)
makedepends=(wget)
source=("$url/zomg")

build() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$startdir/zomg" "$pkgdir/usr/bin/zomg"
}

# vim:set ts=2 sw=2 et:
md5sums=('22513619386bdfc44c92799c2983a88a')
sha1sums=('3cb57f923829b3d464592bb44c70b0ed86f42f1d')
