# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=pdfviewer
_plugin_version=0.8.1
pkgdesc="PDF viewer written in Javascript for Firefox"
license=('GPLv3')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url="https://github.com/mozilla/pdf.js/"
depends=("firefox>=4" "firefox<25.0")
source=("https://addons.cdn.mozilla.net/storage/public-staging/352704/pdf_viewer-${pkgver}-sm+fx+an.xpi")
md5sums=('0fc19aaae310bd160b861663c1940f9e')
sha1sums=('a8b854816055a11bc804391614210ffcf851424e')
package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/pdf_viewer-$pkgver-sm+fx+an.xpi
  chmod -R 755 $dstdir
}
