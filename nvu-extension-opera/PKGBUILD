pkgname=nvu-extension-opera
pkgver=1.0
pkgrel=1
pkgdesc="Opera Browser extension for Nvu"
url="http://www.nvu.com/Building_From_Source.php#tipsandhints"
license=""
depends=()
makedepends=()
conflicts=('nvu-extension-konqueror' 'nvu-extension-firefox' \
           'nvu-extension-seamonkey' 'nvu-extension-mozilla' \
           'nvu-extension-epiphany')
replaces=()
backup=()
provides=()
install=
source=(mozilla-ext)
md5sums=('d7c49b93feb084764a7b1e11ae9203f7')

build() {
  mkdir -p $startdir/pkg/opt/mozilla/bin
  install -m755  $startdir/src/mozilla-ext $startdir/pkg/opt/mozilla/bin/
}
