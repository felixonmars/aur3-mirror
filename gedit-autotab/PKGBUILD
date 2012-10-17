# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gedit-autotab
pkgver=0.8
pkgrel=1
pkgdesc="Automatically detect tab preferences for source files"
arch=('any')
url="http://code.google.com/p/gedit-autotab/"
license=('GPL3')
depends=('gedit')
# Source tarball taken from http://git.slashdev.ca/gedit-autotab/?h=gedit3
# (Packaged commit: 07fc4ed3bd0b46e04e705e885ae91bc38c63cd6d)
source=(gedit-autotab.tar.gz)
sha1sums=('bc33bc9425589919d935c62c8aeafebe1a6edb9b')

build() {
  true
}

package() {
  cd "$srcdir/gedit-autotab"

  install -d "$pkgdir/usr/lib/gedit/plugins"
  install -m644 -t "$pkgdir/usr/lib/gedit/plugins/" autotab.{plugin,py}
}

# vim:set ts=2 sw=2 et:
