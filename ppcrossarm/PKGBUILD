pkgname=ppcrossarm
pkgver=2.7.1 # for Android
pkgrel=1
pkgdesc="Free Pascal cross compiler for ARM"
arch=(i686 x86_64)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
depends=("fpc>=2.6.2")
makedepends=(subversion)
source=("${pkgname%-*}::svn+http://svn.freepascal.org/svn/fpc/trunk")
md5sums=('SKIP')

build() {
  cd "$srcdir/ppcrossarm/compiler"
  fpcmake -Tall
  make arm
}

package() {
  install -Dm755 "${srcdir}/ppcrossarm/compiler/ppcarm" "$pkgdir/usr/lib/fpc/$pkgver/ppcrossarm"
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/lib/fpc/$pkgver/ppcrossarm" .
}
