# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: JBGoode <jbgoode@hush.com>

pkgname=gtk3-murrine-engine-git
pkgver=0.98.1.1.r385.ee3e2f3
pkgrel=1
pkgdesc="The marvelous gtk3 cairo engine (development version)"
arch=('i686' 'x86_64')
url="http://cimitan.com/murrine/"
license=('LGPL')
depends=('gtk3')
makedepends=('git' 'intltool')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("${pkgname%-*}"::"git+https://git.gnome.org/browse/murrine#branch=gtk+3"
        "newer-automakes.patch")
sha256sums=('SKIP'
            'f36037693603ca450a8bc7e2c0ba7269af18640123b87fc6dd2eb11b3e423be3')

pkgver() {
  cd "${pkgname%-*}"

  _ver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]//g')
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "$_ver.r%s.%s" "$_rev" "$_hash"
}

prepare() {
  cd "${pkgname%-*}"

  patch -Nup1 < ../newer-automakes.patch
}

build() {
  cd "${pkgname%-*}"

  ./autogen.sh --prefix=/usr #--enable-animation --enable-animationrtl
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR="$pkgdir" install
}
