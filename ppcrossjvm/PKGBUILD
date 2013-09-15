pkgname=ppcrossjvm
pkgver=2.7.1
pkgrel=1
pkgdesc="Free Pascal cross compiler for JVM"
arch=(i686 x86_64)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
depends=("fpc>=2.6.2" java-environment)
makedepends=(subversion)
source=("${pkgname%-*}::svn+http://svn.freepascal.org/svn/fpc/trunk"
"ftp://ftp.freepascal.org/pub/fpc/contrib/jvm/fpcjvmutilities.zip"
"javapp.sh"
"jasmin-fpc.sh")
md5sums=('SKIP'
         '033cebfcf3894429bb230a98b4d202e4'
         '0a4969f8d36ecf087c3a25ffb5bd1558'
         '967ca2650947cd3cd803756e646c323b')

build() {
  cd "$srcdir/ppcrossjvm/utils/fpcm"
  mv Makefile Makefile.org
  fpcmake -Tall Makefile.fpc.fpcmake
  make clean all
  mv Makefile.org Makefile
  cd "../fpcres"
  fpc fpcjres.pas
  cd "../../compiler"
  make OPT="-O2" jvm
}

package() {
  install -Dm755 "${srcdir}/ppcrossjvm/compiler/ppcjvm" "$pkgdir/usr/lib/fpc/$pkgver/ppcrossjvm"
  install -Dm755 "$srcdir/ppcrossjvm/utils/fpcm/fpcmake" "$pkgdir/usr/bin/fpcmake-2.7"
  install -m755 "$srcdir/ppcrossjvm/utils/fpcres/fpcjres" "$pkgdir/usr/bin/fpcjres"
  install -m755 "$srcdir/javapp.sh" "$pkgdir/usr/bin/javapp"
  install -m755 "$srcdir/jasmin-fpc.sh" "$pkgdir/usr/bin/jasmin-fpc"
  cp $srcdir/*.jar "$pkgdir/usr/lib/fpc/$pkgver/"
  find $pkgdir/usr/bin -type f -exec sed -i "s,@VERSION@,$pkgver," {} \;
  cd "$pkgdir/usr/bin"
  ln -s "/usr/lib/fpc/$pkgver/ppcrossjvm" .
}
