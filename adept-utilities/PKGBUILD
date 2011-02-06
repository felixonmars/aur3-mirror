# Maintainer: fishfish <chiizufish of the gmail variety>
pkgname=adept-utilities
pkgver=2.1.1
pkgrel=1
pkgdesc="utilities to manage and communicate with Digilent's devices"
arch=('i686')
url="http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,828&Prod=ADEPT2"
license=('custom')
depends=('adept-runtime')
install=adept-utilities.install
source=('digilent.adept.utilities_2.1.1-i686.tar.gz::http://www.digilentinc.com/Cart/Download.cfm?DURL=/Data/Products/ADEPT2/digilent.adept.utilities_2.1.1-i686.tar.gz&ProductID=Adept2.1.1-L-86')
md5sums=('8eb4717d0ca997fa6c5f812dc23ef5a1')

package() {
  cd "$srcdir/digilent.adept.utilities_$pkgver-i686"

  mkdir -p "$pkgdir/usr/bin"
  install -m 755 bin/* "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m 644 man/* "$pkgdir/usr/share/man/man1"

  # EULA
  mkdir -p "$pkgdir/usr/share/licenses/adept-utilities"
  install -m 644 EULA "$pkgdir/usr/share/licenses/adept-utilities"
}

# vim:set ts=2 sw=2 et:
