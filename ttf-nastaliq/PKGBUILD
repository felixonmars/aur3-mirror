# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=ttf-nastaliq
pkgver=1
pkgrel=1
pkgdesc="A True-Type Urdu font which uses Unicode Arabic coding."
url="http://yudit.org/download/fonts"
license=(GPL)
arch=('i686' 'x86_64')
depends=('fontconfig' 'xorg-font-utils')
makedepends=()
conflicts=()
provides=()
install=$pkgname.install
source=('http://yudit.org/download/fonts/nastaliq.ttf')
md5sums=('25f564202072e46593b036bdf0f6a818')

build() {
  mkdir -p $startdir/pkg/usr/share/fonts/TTF
  install -m644 $startdir/src/nastaliq.ttf $startdir/pkg/usr/share/fonts/TTF
}
