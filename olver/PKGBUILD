# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=olver
pkgver=1.5
pkgrel=1
pkgdesc="LSB Test Suite for LSB Core 3.1"
arch=('x86_64')
url="http://linuxtesting.org/results/testsuite"
license=('APACHE')
makedepends=('rpmextract')
source=("http://linuxtesting.org/downloads/$pkgname-core-$pkgver-0.x86_64.rpm")
md5sums=('da3bcac396624c5c96ba2dfcd7766a2c')

build() {
  cd "$srcdir"

  msg2 "Extracting source rpm..."
  rpmextract.sh "${pkgname}-core-${pkgver}-0.${CARCH}.rpm"
}

package() {
  cd "$srcdir"

  msg2 "Sorting out files..."
  mkdir -p "${pkgdir}/opt/olver"
  cp -r opt/lsb/test/olver-core/* "${pkgdir}/opt/olver"
  cp -r usr "${pkgdir}"

  msg2 "Cleaning up..."
  rm -rf "$pkgdir/opt/olver/doc/*.doc"
}

# vim:set ts=2 sw=2 et:
