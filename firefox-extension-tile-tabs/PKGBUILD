# Maintainer: Romain Schmitz <slopjong@archlinux.lu>
pkgname=firefox-extension-tile-tabs
pkgver=10.4
pkgrel=1
pkgdesc="Firefox add-on for displaying multiple websites in one tab."
arch=('any')
url="http://addons.mozilla.org/en-US/firefox/addon/tile-tabs/"
license=('GPL')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/storage/public-staging/71411/tile_tabs-${pkgver}-fx.xpi")
sha256sums=('76fc4c13fe244cd7ff6bd3acea85cf487ab5cee9986c00d08f8018780fa6b891')

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  installdir=$pkgdir/usr/lib/firefox/extensions/$emid

  install -d ${installdir} || return 1
  cp -a * ${installdir} || return 1
}
