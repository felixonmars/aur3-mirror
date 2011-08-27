# Maintainer: Tomas Lindquist Olsen <tomas.l.olsen@gmail.com>

# All these symbols were created by

pkgname=geda-smallsym
pkgver=20080103
pkgrel=1
#epoch=
pkgdesc="Small symbols for gschem"
arch=(any)
url="http://www.sp5pbe.waw.pl/~sp5smk/my-gaf-pcb.html"
license=('GPL')
#groups=(geda)
depends=(geda-gaf)
makedepends=(autoconf)
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=(http://www.sp5pbe.waw.pl/~sp5smk/$pkgname-$pkgver.tar.gz gafrc.proto)
noextract=()
md5sums=('9ff390e7355d7c8b7cffb1e6c47f4f12'
         'f4996d52a48cf7b8c9077c193fb9ebd9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -c -m 644 "$srcdir/gafrc.proto" "$pkgdir/usr/share/gEDA/smallsym/gafrc.proto"
}

# vim:set ts=2 sw=2 et:


