pkgname=nvu-extension-konqueror
pkgver=1.0
pkgrel=1
pkgdesc="KDE's Konqueror Browser extension for Nvu"
url="http://www.nvu.com/Building_From_Source.php#tipsandhints"
license=""
depends=()
makedepends=()
conflicts=('nvu-extension-mozilla' 'nvu-extension-firefox' \
           'nvu-extension-seamonkey' 'nvu-extension-opera' \
           'nvu-extension-epiphany')
replaces=()
backup=()
provides=()
replaces=()
install=
source=(mozilla-ext)
md5sums=('2a0172451a09b8d2a83f19c9073f7397')

build() {
  mkdir -p $startdir/pkg/opt/mozilla/bin
  install -m755  $startdir/src/mozilla-ext $startdir/pkg/opt/mozilla/bin/
}
