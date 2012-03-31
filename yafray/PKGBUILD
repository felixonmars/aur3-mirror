# Based on Gentoo yafray-0.0.9-r1.ebuild
# Maintainer: PitBall
pkgname=yafray
pkgver=0.0.9
pkgrel=2
pkgdesc="Raytracing open source render engine (old version)"
arch=('i686' 'x86_64')
url="http://www.yafaray.org/"
license=('LGPL2.1')
depends=('openexr' 'libjpeg')
makedepends=('scons' 'python2')
source=("http://www.yafaray.org/sites/default/files/download/builds/$pkgname-$pkgver.tar_.gz"
	"$pkgname-$pkgver-scons.patch"
	"$pkgname-$pkgver-libdir.patch"
	"$pkgname-$pkgver-etc.patch"
	"$pkgname-$pkgver-gcc43.patch"
	"$pkgname-$pkgver-asneeded.patch"
	"$pkgname-$pkgver-gcc44.patch")
md5sums=('7365122e0ca6f439988f51e8b4db935c'
         '45585b98f2e7eeabb4179d5786a51967'
         '29c15b0840eb6656c70f874f1d02bd03'
         'bd9021598ce0a9f3a7438d0fd9bfa499'
         '6ec90b491fb47b39139b2b2eae3b0028'
         '1cd7731e245718ba4b3150e78c039550'
         'eac22f2520b72aefc2b2f4bc2c5e5dfa')

build() {
  cd "$srcdir/$pkgname"
  msg "Patching..."
  patch -Np1 -i $srcdir/$pkgname-$pkgver-scons.patch
  patch -Np1 -i $srcdir/$pkgname-$pkgver-libdir.patch
  patch -Np0 -i $srcdir/$pkgname-$pkgver-etc.patch
  patch -Np1 -i $srcdir/$pkgname-$pkgver-gcc43.patch
  patch -Np1 -i $srcdir/$pkgname-$pkgver-asneeded.patch
  patch -Np1 -i $srcdir/$pkgname-$pkgver-gcc44.patch
  sed -i -e "s:-O3:${CXXFLAGS} -fsigned-char:g" *-settings.py
  msg "Compiling..."
  scons ${MAKEOPTS} prefix="/usr" \
 	 exr_path="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  msg "Packaging..."
  scons prefix="/usr" destdir="$pkgdir"  install

}

# vim:set ts=2 sw=2 et:
