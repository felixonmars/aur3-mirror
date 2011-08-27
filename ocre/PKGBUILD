# Contributor: rabyte <rabyte*gmail>
# Maintainer: Laurie Clark-Michalek <bluepeppers@archlinux.us>

pkgname=ocre
pkgver=0.033
pkgrel=1
pkgdesc="Reads an image file and writes ASCII or Unicode characters"
arch=('i686' 'x86_64')
url="http://lem.eui.upm.es/ocre.html"
license=('GPL3')
depends=('aspell' 'gtk2')
makedepends=('pkgconfig')
source=(ftp://lem.eui.upm.es/pub/$pkgname/${pkgname}_v${pkgver//./_}.tgz)

build() {
  cd $pkgname-$pkgver/$pkgname

  make CFLAGS="${CFLAGS} $(pkg-config --cflags gtk+-2.0) -Isrc" || return 1
  make DESTDIR=$pkgdir/usr install installman
}

# vim:set ts=2 sw=2 et:
md5sums=('e2a56b4b370876be38cfc7f440d00973')
