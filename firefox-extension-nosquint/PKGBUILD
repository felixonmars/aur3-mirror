# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=nosquint
_plugin_version=2.1.2
_plugin_id=2592
pkgdesc="Plugin for firefox which allows you to adjust the  zoom levels as well as color settings."
license=('LGPL')

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
md5sums=('29c14868e7438f48b5cc059d4a7f09ec')
