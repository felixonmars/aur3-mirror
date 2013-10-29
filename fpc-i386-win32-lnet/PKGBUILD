pkgname=fpc-i386-win32-lnet
pkgver=0.6.5
pkgrel=2
pkgdesc="lNet or Lightweight Networking Library is a collection of classes and components to enable event-driven TCP or UDP networking. (i386-win32)"
url="http://wiki.freepascal.org/lNet"
license=("LGPL")
arch=(any)
makedepends=(ppcross386 dos2unix mingw-w64-binutils)
depends=(fpc-i386-win32-rtl)
options=(!strip)
source=("http://downloads.sourceforge.net/lazarus-ccr/lnet-$pkgver.zip")
sha1sums=('829aef9af514aa30aa1b25c94a04fed5ec5722d6')
_unittgt=i386-win32
_fpcver=`fpc -iV`

prepare() {
	cd "${srcdir}/lnet/lib"
	rm openssl.pas
	sed -i "s,OPENSSLaddallalgorithms,OpenSSL_add_all_algorithms,g" lnetssl.pp
	find . -type f -exec dos2unix {} \;
}

build() {
  cd "${srcdir}/lnet/lib"
  for file in `ls *.pp`
  do
    ppcross386 -O3 -Xs -XX -Isys -Sm -Twin32 $file
  done
}

package() {
  cd "${srcdir}/lnet/lib"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/lnet/"{}
  find "$pkgdir" -name '*.o' -o -name '*.a' | xargs -rtl1 i686-w64-mingw32-strip -g
}
