_plugin_name=YouTubeCenter
_plugin_version=2.1.1

pkgname=firefox-extension-youtube-center
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Contains all kind of different useful functions which makes your visit on YouTube much more entertaining."

license=('MIT')
arch=('any')
url="https://github.com/YePpHa/YouTubeCenter"
depends=("firefox")

source=("https://github.com/YePpHa/${_plugin_name}/releases/download/v${_plugin_version}/${_plugin_name}.xpi")
sha256sums=('fbcfd6111fc4b80b916561aa242bf6cb936a4d70a5d502b6056ddc6b373ca35e')

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/$_plugin_name.xpi
  chmod -R 755 $dstdir
}
