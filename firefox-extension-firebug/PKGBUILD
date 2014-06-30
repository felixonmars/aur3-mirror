# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_plugin_name=firebug
_plugin_version=2.0.1
_plugin_id=1843
pkgdesc="A wealth of development tools at your fingertips while you browse"
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/$_plugin_name/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi")
md5sums=('2905c5972a41e2d6d936573ecb03019d')

prepare() {
  cd $srcdir

  # Ugly hack, bsdtar does not extract the xpi properly...
  unzip -qqo ../addon-1843-latest.xpi
}

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/addon-1843-latest.xpi
  chmod -R 755 $dstdir
}