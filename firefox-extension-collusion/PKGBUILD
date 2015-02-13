# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere
#

_plugin_name=collusion
_plugin_version=1.2.1
pkgdesc="Firefox extension to discover who's tracking you online(aka lightbeam)"
license=('MPLv2')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://www.mozilla.org/en-US/collusion/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/363974/lightbeam_for_firefox-${_plugin_version}-fx.xpi")
sha256sums=('92898cbffb1e8cfc25469bf6449223489eb0675c84ddcc20b68e20127898cb4c')
package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/lightbeam_for_firefox-${_plugin_version}-fx.xpi
  chmod -R 755 $dstdir
}
