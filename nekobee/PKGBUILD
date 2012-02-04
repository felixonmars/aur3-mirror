# Maintainer: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com> 

pkgname=nekobee
pkgver=0.1.7
pkgrel=2
pkgdesc="A TB303-style synthesizer for DSSI"
url="http://www.nekosynth.co.uk/wiki/nekobee"
depends=('liblo' 'gtk2')
makedepends=('dssi')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://www.nekosynth.co.uk/releases/$pkgname-$pkgver.tar.gz)
md5sums=('e8b491b83e77f778df542d0066271d40')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
