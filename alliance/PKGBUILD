# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=alliance
pkgver=5.0_20110203
pkgrel=2
pkgdesc="Free CAD tools and libraries for VLSI design (complete design flow from VHDL to layout)"
arch=('i686' 'x86_64')
url="http://www-asim.lip6.fr/recherche/alliance/"
license=('GPL')
depends=('lesstif' 'libxpm')
optdepends=('zsh: bench script')
options=('!libtool')
install="$pkgname.install"
source=("${url/recherche/pub}distribution/${pkgver/_*}/${pkgname}-${pkgver/_/-}.tar.gz")
md5sums=('fad7ddc0f74beac0d0abb2701f50fec5')

build() {
  cd "$srcdir/$pkgname-${pkgver/_*}"

  # Does not build with -Wl,--as-needed
  export LDFLAGS="${LDFLAGS//,--as-needed}"

  # profile.d script fix
  sed -e "s|SYSCONF_TOP=\$ALLIANCE_TOP|&/etc|" \
      -e "s|CELLS_TOP=\$ALLIANCE_TOP|&/cells|" \
      -i distrib/etc/alc_env.sh.in

  # desktop files fix
  sed -e "s|\(Cat.*=\)E|\1Development;E|" \
      -e "s|ALLIANCE_TOP/bin/||" \
      -i distrib/*.desktop

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

  # install desktop files and pixmaps
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  install -Dm644 distrib/*.desktop "$pkgdir/usr/share/applications"
  install -Dm644 distrib/*.png "$pkgdir/usr/share/pixmaps"

  # prevent conflict with man3 log
  cd "$pkgdir/usr/share/man/man3" && mv log.3 log-$pkgname.3

  # remove unneeded csh profile.d script
  rm "$pkgdir/etc/profile.d/alc_env.csh"
}
