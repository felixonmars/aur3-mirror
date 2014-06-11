pkgname=lnet
pkgver=0.6.5
pkgrel=3
pkgdesc="lNet or Lightweight Networking Library is a collection of classes and components to enable event-driven TCP or UDP networking."
url="http://wiki.freepascal.org/lNet"
license=("LGPL")
arch=(i686 x86_64)
makedepends=(fpc lazarus dos2unix)
source=("http://downloads.sourceforge.net/lazarus-ccr/lnet-$pkgver.zip")
sha1sums=('829aef9af514aa30aa1b25c94a04fed5ec5722d6')
options=(staticlibs)
_unittgt=`fpc -iSP`-`fpc -iSO`
_fpcver=`fpc -iV`

prepare() {
	cd "${srcdir}/lnet/lib"
	rm openssl.pas
	sed -i "s,OPENSSLaddallalgorithms,OpenSSL_add_all_algorithms,g" lnetssl.pp
	find . -type f -exec dos2unix {} \;
}

build() {
	cd "${srcdir}/lnet/lazaruspackage"
	lazbuild --lazarusdir=/usr/lib/lazarus lnetbase.lpk
}

package() {
	cd "${srcdir}/lnet/lazaruspackage"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lnet/LICENSE"
	install -m644 LICENSE.ADDON "$pkgdir/usr/share/licenses/lnet/LICENSE.ADDON"
	cd lib/$_unittgt
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/lnet/"{} \;
}
