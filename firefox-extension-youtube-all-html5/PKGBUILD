# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=youtube-all-html5
_plugin_version=2.1.3
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Play all videos on youtube without flash in your preferred size using only HTML5."
license=('GPL3')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/youtube-all-html5/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/438608/addon-438608-latest.xpi")
md5sums=('b6af71321ca2025b4dc5215ac07a7477')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/addon-438608-latest.xpi
  chmod -R 755 $dstdir
}
