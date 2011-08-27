# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=pxscan
pkgver=0.41
pkgrel=1
pkgdesc="Linux driver for the Primax Colorado Direct 9600 scanner and other scanners based on the 'E3' ASIC"
arch=(i686)
url="http://home2.swipnet.se/~w-25069/pxscan.html"
license=('unknown') 
groups=()
depends=(libtiff)
makedepends=(libtiff)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://home2.swipnet.se/%7Ew-25069/$pkgname-$pkgver.tgz")
noextract=()
md5sums=('4b96a5854f649a743f94c2cc5030e73c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's#asm/io.h#sys/io.h#' portio.c   || return 1
  sed -i 's#asm/io.h#sys/io.h#' probe_lp.c || return 1
  sed -i 's#asm/io.h#sys/io.h#' pxscan.c   || return 1

  make || return 1
  cd -
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/$pkgname-$pkgver/pxscan $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
