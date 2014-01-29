# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=vfplot
pkgver=1.0.11
pkgrel=1
pkgdesc="A program for plotting two-dimensional vector fields."
arch=(i686 x86_64)
url="http://soliton.vm.bytemark.co.uk/pub/vfplot/"
license=('GPL3')
depends=('gerris-snapshot')
source=("${url}src/$pkgname-$pkgver.tar.gz")
md5sums=('526928664c2d73abebaa49eb5c473c2c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix="$pkgdir/usr" \
              --enable-gerris
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}

# vim:set ts=2 sw=2 et:
