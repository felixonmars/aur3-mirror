pkgname=nvu-extension-firefox
pkgver=1.0
pkgrel=1
pkgdesc="Mozilla Firefox Browser extension for Nvu"
url="http://www.nvu.com/Building_From_Source.php#tipsandhints"
license=""
depends=()
makedepends=()
conflicts=('nvu-extension-konqueror' 'nvu-extension-mozilla' \
           'nvu-extension-seamonkey' 'nvu-extension-opera' \
           'nvu-extension-epiphany')
replaces=()
backup=()
provides=()
install=
source=(mozilla-ext)
md5sums=('27f018ad243b769c65faeed3b42bcc89')

build() {
  mkdir -p $startdir/pkg/opt/mozilla/bin
  install -m755  $startdir/src/mozilla-ext $startdir/pkg/opt/mozilla/bin/
}
