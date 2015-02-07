_plugin_name=terms_of_service_didnt_read
_plugin_version=0.4.1

pkgname=firefox-extension-terms-of-service-didnt-read
pkgver=$_plugin_version
pkgrel=1
pkgdesc=("Get information instantly about websites' terms of service and privacy policies, with ratings and summaries from the Terms of Service; Didn't Read project.")

license=('AGPL3')
arch=('any')
url="https://tosdr.org/index.html"
depends=("firefox")

source=("https://addons.mozilla.org/firefox/downloads/file/287284/${_plugin_name}-${_plugin_version}.xpi")
sha256sums=('49d5e0e6a23e2d272e422256c654cba76646670e791aed67a1b976ad339ad804')

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/$_plugin_name-$_plugin_version.xpi
  chmod -R 755 $dstdir
}
