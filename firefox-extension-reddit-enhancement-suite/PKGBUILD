_plugin_name=reddit_enhancement_suite
_plugin_version=4.5.4

pkgname=firefox-extension-reddit-enhancement-suite
pkgver=$_plugin_version
pkgrel=1
pkgdesc="A suite of tools to enhance Reddit."

license=('GPL3')
arch=('any')
url="http://redditenhancementsuite.com/"
depends=("firefox")

source=("https://addons.mozilla.org/firefox/downloads/file/290816/${_plugin_name}-${_plugin_version}-fx.xpi")
md5sums=('a6e78cf676f5bdd7f19c045cd19eed32')

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/$_plugin_name-$_plugin_version-fx.xpi
  chmod -R 755 $dstdir
}
