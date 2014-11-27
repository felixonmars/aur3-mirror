_plugin_name=wot
_plugin_version=20131118
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Add WOT to your browser to protect yourself from online threats that anti-virus software can’t spot."
license=('MIT')
arch=('any')
url="https://www.mywot.com/"
depends=("firefox")
source=("https://www.mywot.com/files/downloads/wot-latest.xpi")
md5sums=('9cd574beda80d269b1d26159c8786f5d')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/wot-latest.xpi
  chmod -R 755 $dstdir
}

