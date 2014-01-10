# Maintainer: Romain Schmitz <slopjong .at. slopjong .dot. de>
#
# For the standalone sqlite manager see
# --> https://aur.archlinux.org/packages/sq/sqlite-manager/PKGBUILD

_plugin_name=sqlite-manager
_plugin_version=0.8.1
_plugin_id=5817
pkgdesc="A SQLite database manager in firefox."
license=('MPL')

pkgname=firefox-extension-${_plugin_name}
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_id}"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/storage/public-staging/${_plugin_id}/${_plugin_name}-${_plugin_version}-fx+tb+sm.xpi")
sha256sums=('0d8e0203a082ee28fa489971e55b6ad6d2042b336882d3b0a579c3790d068c15')

build() {
  cd "$srcdir"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/extensions/$emid"
  install -d "$dstdir"
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>13.*</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * "$dstdir"
}
