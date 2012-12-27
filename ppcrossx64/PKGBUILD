pkgname=ppcrossx64
pkgver=2.6.0
pkgrel=2
pkgdesc="Free Pascal cross compiler for x86_64"
arch=(i686 x86_64)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
depends=("fpc=2.6.0")
makedepends=("fpc=2.6.0")
conflicts=(fpc-cross-x86_64-win64)
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
md5sums=('17375e665a4e1311f85812fe2754f609')

build() {
  cd "$srcdir/fpcbuild-$pkgver/fpcsrc/compiler"
  fpcmake -Tall
  make OPT="-O2" x86_64
}

package() {
  install -Dm755 "${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler/ppcx64" "$pkgdir/usr/lib/fpc/$pkgver/ppcrossx64"
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/lib/fpc/$pkgver/ppcrossx64" .

  cat << 'EOM'
  ==> PLEASE NOTE:
  ==> Please be sure to copy fpcbuild-x.x.x.tar.gz to the extracted package folders
  ==> of any RTLs or other FPC cross compilers you intend to build, as Free Pascal's
  ==> FTP server is very low bandwidth. Thanks!
EOM
}
