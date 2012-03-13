pkgname=ppcrossmips
pkgver=2.6.0
pkgrel=1
pkgdesc="Free Pascal cross compiler for MIPS (big endian)"
arch=('i686' 'x86_64')
url="http://www.freepascal.org/"
license=('GPL' 'LGPL' 'custom')
depends=('fpc=2.6.0')
makedepends=('fpc=2.6.0')
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
md5sums=('17375e665a4e1311f85812fe2754f609')

build() {
  cd "$srcdir/fpcbuild-$pkgver/fpcsrc/compiler"
  fpcmake -Tall
  make OPT="-O2" mips
}

package() {
  mkdir -p "$pkgdir/usr/lib/fpc/$pkgver"
  cd "$pkgdir/usr/lib/fpc/$pkgver"
  cp "${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler/ppcmips" ppcrossmips
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/lib/fpc/$pkgver/ppcrossmips" .
  
  cat << 'EOM'
  ==> PLEASE NOTE:
  ==> Please be sure to copy fpcbuild-x.x.x.tar.gz to the extracted package folders
  ==> of any RTLs or other FPC cross compilers you intend to build, as Free Pascal's 
  ==> FTP server is very low bandwidth. Thanks!    
EOM
}