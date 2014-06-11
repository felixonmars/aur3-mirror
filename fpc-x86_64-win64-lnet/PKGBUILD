pkgname=fpc-x86_64-win64-lnet
pkgver=0.6.5
pkgrel=3
pkgdesc="lNet or Lightweight Networking Library is a collection of classes and components to enable event-driven TCP or UDP networking. (x86_64-win64)"
url="http://wiki.freepascal.org/lNet"
license=("LGPL")
arch=(any)
makedepends=(fpc-x86_64-win64-rtl dos2unix mingw-w64-binutils)
options=(!strip staticlibs !buildflags)
source=("http://downloads.sourceforge.net/lazarus-ccr/lnet-$pkgver.zip")
sha1sums=('829aef9af514aa30aa1b25c94a04fed5ec5722d6')
_unittgt=x86_64-win64
_fpcver=`fpc -iV`

prepare() {
	cd "${srcdir}/lnet/lib"
	rm openssl.pas
	sed -i "s,OPENSSLaddallalgorithms,OpenSSL_add_all_algorithms,g" lnetssl.pp
	find . -type f -exec dos2unix {} \;
}

build() {
	cd "${srcdir}/lnet/lazaruspackage"
	lazbuild --lazarusdir=/usr/lib/lazarus --os=win64 --cpu=x86_64 lnetbase.lpk
}

package() {
	cd "${srcdir}/lnet/lazaruspackage/lib/$_unittgt"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/lnet/"{} \;
	find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
