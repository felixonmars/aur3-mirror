# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=savi
pkgver=1.4.6
pkgrel=1
pkgdesc="SaVi allows you to simulate satellite constellations in two and three dimensions such as Iridium and Globalstar"
arch=('i686' 'x86_64')
url="http://savi.sourceforge.net/"
license=('copyright-freeware')
depends=('tcl' 'tk')
optdepends=('geomview')
source=(http://personal.ee.surrey.ac.uk/Personal/L.Wood/software/SaVi/src/releases/$pkgname$pkgver-release.tar.gz)
install=savi.install
md5sums=('09636dbc0682839262c62075884f9e2a')

build() {
  cd $srcdir/$pkgname$pkgver

  ./configure
  make
}

package() {
  cd $srcdir/$pkgname$pkgver

  mkdir  $pkgdir/usr
  mkdir  $pkgdir/usr/local
  mkdir  $pkgdir/usr/local/savi
  cp -R  ./* $pkgdir/usr/local/savi
  cp $srcdir/savi $pkgdir/usr/local/savi
}
