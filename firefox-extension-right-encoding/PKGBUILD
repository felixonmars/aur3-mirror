# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=right-encoding
_plugin_version=0.2.5
_plugin_id=76838
pkgdesc="Plugin for firefox. Adds the Character Encoding menu to the context menu."
license=('BSD')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
_ffver=`pacman -Q firefox | cut -f2 -d\ | cut -f1 -d-`
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
makedepends=('unzip')
source=(plugin_info)

build() {
  depends=("firefox>=${_ffver}" "firefox<=${_ffver/0/99}")
  cd $srcdir
  rm * -rf
  wget https://addons.mozilla.org/firefox/downloads/latest/$_plugin_id/addon-$_plugin_id-latest.xpi
  bsdtar -xf addon-$_plugin_id-latest.xpi
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox-$_ffver/extensions/${emid}
  install -d $dstdir
  sed -i "s#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>${_ffver/0/99}</em:maxVersion>#" install.rdf
  rm addon-$_plugin_id-latest.xpi
  cp -R * $dstdir
}
md5sums=('c9997fb5cd4ade4cd349bad1277507ae')
