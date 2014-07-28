# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=color-toggle
pkgname=firefox-extension-$_plugin_name
pkgver=0.15
pkgrel=1
pkgdesc="Plugin for firefox. Toggles colors between two color profiles."
arch=('any')
url="https://addons.mozilla.org/de/firefox/addon/color-toggle/"
license=('MPL')
depends=("firefox")
#source=("https://addons.mozilla.org/firefox/downloads/file/122239/color_toggle-0.15-fx.xpi")
source=("${_plugin_name}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/latest/9408/addon-9408-latest.xpi")
md5sums=('6102f4620df8a0a32753255f8b9ad3ec')


package() {
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>31.*</em:maxVersion>#' install.rdf
  rm *.xpi
  cp -dpr --no-preserve=ownership * $dstdir
}
