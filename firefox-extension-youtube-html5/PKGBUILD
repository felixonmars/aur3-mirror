# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=youtube-html5
_plugin_version=0.7.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Adds the &html5=1 option to YouTube-URLs during page load."
license=('MIT')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/youtube-html5-video/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/429648/addon-429648-latest.xpi")
md5sums=('b950ed04a227b93820730ede1feb17b3')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/addon-429648-latest.xpi
  chmod -R 755 $dstdir
}
