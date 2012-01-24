pkgname=test-cocoon-bin
pkgver=1.6.14
pkgrel=1
pkgdesc="complete code coverage tool chain for C/C++ and C#"
arch=(i686 x86_64)
url="http://www.testcocoon.org/"
license=('GPL')
_libprefix=
[ "$CARCH" == "x86_64" ] && _libprefix='lib32-'
depends=(${_libprefix}zlib ${_libprefix}gcc-libs)
makedepends=()
optdepends=()
backup=()
options=()
install=
source=(http://www.testcocoon.org/binaries/TestCocoonSetup_$pkgver.run)
md5sums=('6a8866f25b07a5880676db56a062db0d')

build() {
  cd "$srcdir/"
  echo q | sh TestCocoonSetup_$pkgver.run --target ./testcocoon
}

package() {
  cd "$pkgdir/"
  tar xf $srcdir/testcocoon/TestCocoonInstall.tar
}
