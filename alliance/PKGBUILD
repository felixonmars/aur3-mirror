# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=alliance
pkgver=5.0_20110203
pkgrel=1
pkgdesc="Free CAD tools and libraries for VLSI design (complete design flow from VHDL to layout)"
arch=('i686' 'x86_64')
url="http://www-asim.lip6.fr/recherche/alliance/"
license=('GPL')
depends=('lesstif' 'libxpm')
optdepends=('zsh: bench script')
options=('!libtool')
source=("${url/recherche/pub}distribution/${pkgver/_*}/${pkgname}-${pkgver/_/-}.tar.gz")
md5sums=('fad7ddc0f74beac0d0abb2701f50fec5')

build() {
  cd "$srcdir/$pkgname-${pkgver/_*}"

  # Does not build with -Wl,--as-needed
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  ./configure --prefix=/opt/$pkgname \
              --mandir=/usr/share/man \
              --libdir=/usr/lib \
              --includedir=/usr/include/$pkgname \
              --enable-alc-shared \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver/_*}"

  make DESTDIR="$pkgdir/" install
}
