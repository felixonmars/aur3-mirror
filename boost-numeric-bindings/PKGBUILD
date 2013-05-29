# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=boost-numeric-bindings
pkgver=20081116
pkgrel=2
pkgdesc="A bindings library for Boost.Ublas, for calling BLAS, LAPACK, UMFPACK, MUMPS and many other numerical codes from within C++."
arch=('any')
url="http://mathema.tician.de/software/boost-numeric-bindings/"
license=('custom')
depends=('boost')
source=("http://mathema.tician.de/dl/software/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('835c88497ba8d6fd745e3971c560a6a3')

prepare() {
  cd "$srcdir/$pkgname"
  sed "s|boost-numeric-bindings/||" Makefile.in > Makefile
}

package() {
  cd $srcdir/$pkgname
  make PREFIX="$pkgdir/usr" install

  # license
  install -Dm644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}