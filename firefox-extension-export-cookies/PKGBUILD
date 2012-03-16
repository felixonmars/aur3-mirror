# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=export-cookies
_plugin_version=1.2
_plugin_id=8154
pkgdesc="Plugin for firefox. Exports all cookies to standard cookies.txt file."
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=7
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/102739/export_cookies-1.2-fx.xpi")

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>11.*</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * $dstdir
}
md5sums=('8682ed40a9c24501534379fb71ea69eb')
