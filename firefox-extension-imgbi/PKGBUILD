_plugin_name=imgbi
_plugin_version=0.1

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Upload images to img.bi secure image hosting."

license=('GPL3')
arch=('any')
url="https://img.bi/"
depends=("firefox")

source=("https://addons.mozilla.org/firefox/downloads/file/234964/${_plugin_name}-${_plugin_version}.xpi")
sha256sums=('e4475efc1dc48c1b5b161c6f3bf1be07c1a6b699a4309db19376a1696c4bddbd')

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/$_plugin_name-$_plugin_version.xpi
  chmod -R 755 $dstdir
}
