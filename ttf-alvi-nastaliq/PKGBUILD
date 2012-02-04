# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=ttf-alvi-nastaliq
pkgver=2
pkgrel=1
pkgdesc="A True-Type Urdu font which uses Unicode Arabic coding."
url="http://alvi.urdushare.net/blog/200811/download-alvi-nastaleeq/"
license=(custom)
arch=('i686' 'x86_64')
depends=('fontconfig' 'xorg-font-utils')
makedepends=()
conflicts=()
provides=()
install=$pkgname.install
source=('http://alvi.urdushare.net/alvi_Nastaleeq.zip')
md5sums=('eeff90f9e4ad3e779ca2c54a9faa6dda')

build() {
  mkdir -p $startdir/pkg/usr/share/fonts/TTF
  install -m644 $startdir/src/alvi_Nastaleeq_Lahori_shipped.ttf $startdir/pkg/usr/share/fonts/TTF
}
