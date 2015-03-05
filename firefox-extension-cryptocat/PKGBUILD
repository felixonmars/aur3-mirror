# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere
# I am pretty sure this has been discontinued, the upstream URL is dead, and has

_plugin_name=cryptocat
_plugin_version=2.2.2
pkgdesc="Web based encrypted(OTR) IM client for Firefox"
license=('GNU Affero')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url="https://crypto.cat/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/398258/cryptocat-${_plugin_version}-fx.xpi")
sha256sums=('3d8a8b2c318f816acd084bbf8e49147b4ae01bb1cbfc5242cf5d02239544a068')
package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/$_plugin_name-$pkgver-fx.xpi
  chmod -R 755 $dstdir
}
