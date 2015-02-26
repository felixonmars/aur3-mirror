_plugin_name=self_destructing_cookies
_plugin_version=0.4.7

pkgname=firefox-extension-self-destructing-cookies
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Gets rid of a site's cookies and LocalStorage as soon as you close its tabs."

license=('GPL2')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/self-destructing-cookies"
depends=("firefox")

source=("https://addons.mozilla.org/firefox/downloads/file/297496/${_plugin_name}-${_plugin_version}.xpi")
sha256sums=('ae97a12b07b5246e7d8256464d19c78fa90e586659b06b5e83840d1ea1c3455e')

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/$_plugin_name-$_plugin_version.xpi
  chmod -R 755 $dstdir
}
