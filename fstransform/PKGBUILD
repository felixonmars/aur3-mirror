# Maintainer: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>
pkgname=fstransform
pkgver=0.9.3
pkgrel=1
pkgdesc="Tool to change file-system without the need for backup"
arch=('i686' 'x86_64')
url="http://fstransform.sourceforge.net/"
license=('GPL')
# groups=()
depends=('dash' 'gcc-libs')
# makedepends=('gcc-libs')
# checkdepends=()
# optdepends=()
provides=($pkgname)
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=(http://downloads.sourceforge.net/project/fstransform/$pkgname-$pkgver/$pkgname-$pkgver-src.tar.bz2)
md5sums=('4d6953ffecdc5e2c81b81a723b2c12ad')

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver-src"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
