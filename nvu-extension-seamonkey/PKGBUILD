pkgname=nvu-extension-seamonkey
pkgver=1.0
pkgrel=1
pkgdesc="Seamonkey Suite Browser extension for Nvu"
url="http://www.nvu.com/Building_From_Source.php#tipsandhints"
license=""
depends=()
makedepends=()
conflicts=('nvu-extension-konqueror' 'nvu-extension-firefox' \
           'nvu-extension-mozilla' 'nvu-extension-opera' \
           'nvu-extension-epiphany')
replaces=()
backup=()
provides=()
install=
source=(mozilla-ext)
md5sums=('d9f285710b56401ec307d5c397dccec1')

build() {
  mkdir -p $startdir/pkg/opt/mozilla/bin
  install -m755  $startdir/src/mozilla-ext $startdir/pkg/opt/mozilla/bin/
}
