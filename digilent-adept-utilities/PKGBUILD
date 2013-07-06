# Maintainer: Robin Choudhury  <rchoudhu@calpoly.edu>
pkgname=digilent-adept-utilities
pkgver=2.1.1
pkgrel=1
pkgdesc="Adept 2 for Linux provides the core runtime necessary to communicate with Digilent system boards and a wide assortment of logic devices. This functionality is accessed using the configuration tools in Adept Utilities."
arch=('i686' 'x86_64')
url="http://www.digilentinc.com/Products/Detail.cfm?Prod=ADEPT2"
license=('unknown')
groups=('adept')
depends=('digilent-adept-runtime')
provides=('digilent-adept-utilities')
conflicts=('digilent-adept-utilities')
replaces=('digilent-adept-utilities')
source=($pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.patch)
md5sums=('2bfcdc40cf12bf823ddf76e2d7bb5455')
name="digilent.adept.utilities_"

_source_arch="x86_64"
[ "$CARCH" = "i686" ] && _source_arch="i686"
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.utilities_$pkgver-${_source_arch}.tar.gz")

package() {
   cd "$srcdir/$name$pkgver-$CARCH"
   cd man
   install -Dm655 dadutil.1 "$pkgdir/usr/share/man/man1/dadutil.1"
   install -Dm655 djtgcfg.1 "$pkgdir/usr/share/man/man1/djtgcfg.1"
   cd ..
   if [ "$CARCH" = "x86_64" ]; then
      cd bin64
   else
      cd bin
   fi
   install -Dm755 dadutil "$pkgdir/usr/bin/dadutil"
   install -Dm755 djtgcfg "$pkgdir/usr/bin/djtgcfg"
}
