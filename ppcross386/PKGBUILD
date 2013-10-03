pkgname=ppcross386
pkgver=2.6.2
pkgrel=1
pkgdesc="Free Pascal cross compiler for i386"
arch=(x86_64)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
depends=("fpc>=2.6.2")
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
md5sums=('89c7e60db6280f3d5cc006a4a9ff43a9')

build() {
  cd "$srcdir/fpcbuild-$pkgver/fpcsrc/compiler"
  fpcmake -Tall
  make OPT="-O2" i386
}

package() {
  install -Dm755 "${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler/ppc386" "$pkgdir/usr/lib/fpc/$pkgver/ppcross386"
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/lib/fpc/$pkgver/ppcross386" .
}
