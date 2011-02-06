# Contributor: Jeff Wallace <jeff@tjwallace.ca>

pkgname=libcolorblind
pkgver=0.0.1
pkgrel=1
pkgdesc="Pixel Filter for colorblind accessibility"
arch=('i686' 'x86_64')
url="http://live.gnome.org/TwoPointTwentyseven/ExternalDependencies"
license=('Public Domain')
depends=()
conflicts=()
provides=()
source=(http://alioth.debian.org/frs/download.php/1952/colorblind-$pkgver.tar.gz)
md5sums=('e4eaef242ba880ac09f748d52999916c')

build() {
  cd "$srcdir/colorblind-$pkgver"
  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install
}

