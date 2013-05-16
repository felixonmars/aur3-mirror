# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=new-tong-wen-tang
_plugin_version=0.4.0.9.1
_plugin_id=6113
pkgdesc="Plugin for firefox. A tool to switch display Chinese content between traditional and simplified glyphs."
license=('unknown')
emid={22870005-adef-4c9d-ae36-d0e1f2f27e5a}

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=9
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/125736/addon-0.4.0.9.1-tb+fx+sm.xpi")


build() {
  cd $srcdir
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  sed -i "s#em:maxVersion=\"5#em:maxVersion=\"12#g" install.rdf
  rm *.xpi
  mv * $dstdir
}
md5sums=('01c2d500ddc550e05a80fa492c1d0b33')
