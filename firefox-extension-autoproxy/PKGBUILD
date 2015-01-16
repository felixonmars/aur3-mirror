# Maintainer: -
# Contributors: Det, Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-autoproxy
pkgdesc="Plugin for firefox. Help you use your proxy (http/socks) automatically & efficiently."
pkgver=0.4b2.2013051811
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/autoproxy/"
license=('MPL')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/11009/addon-11009-latest.xpi")
md5sums=('5128a60523dd1c7db59adb1984033bfe')

package() {
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  sed -i 's|<em:maxVersion>.*</em:maxVersion>|<em:maxVersion>99.*</em:maxVersion>|' install.rdf
  rm *.xpi
  mv * $dstdir
}
