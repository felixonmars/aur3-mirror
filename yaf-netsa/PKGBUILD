# Maintainer: Peter Kaloroumakis petekalo gmail com
_origname=yaf
pkgname="$_origname-netsa"
pkgver="2.4.0"
pkgrel=2
pkgdesc="Yet Another Flow sensor"
arch=("i686" "x86_64")
url='http://tools.netsa.cert.org/yaf/'
license=('GPL')
groups=()
depends=(libfixbuf-netsa)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://tools.netsa.cert.org/releases/$_origname-$pkgver.tar.gz)
noextract=()
sha256sums=('0f3a499db51d5e90337780f1ec538f2e53956f01f79652f9dd1d73e39f38f7fb')


build() {
  cd "$srcdir/$_origname-$pkgver"

  ./configure --enable-plugins  --enable-applabel

  make
}

package() {
  cd "$srcdir/$_origname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

