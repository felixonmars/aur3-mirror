# Maintainer: Jerome Barnett <techryda at silentdome dot com>
pkgname=firefox-extension-fxbutton
pkgver=2.3
pkgrel=1
pkgdesc="Add button with appmenu (like GNOME Web / Google Chrome) and hide the default "Firefox" button."
url="https://github.com/seleznev/firefox-extension-fxbutton"
arch=('any')
license=('MPLv2')
depends=("firefox")
makedepends=('unzip')
source=(https://github.com/downloads/seleznev/firefox-extension-fxbutton/firefox-extension-fxbutton-${pkgver}.xpi)
md5sums=('2d00e3a4e673e166f1e52a48ae7c4efe')

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>10.*</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * $dstdir
}

