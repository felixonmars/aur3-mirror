# Maintainer: crobe2 <robspamm@fastmail.fm>
pkgname=adept-sdk
pkgver=2.0.1
pkgrel=1
pkgdesc="sdk include files for the digilent adept suite"
arch=('any' )
url="http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,828&Prod=ADEPT2"
license=('custom')
depends=()
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.sdk_$pkgver.tar.gz")

md5sums=('5af6304dfbf890dd36aca50312a20ebb')

package() {
  cd "$srcdir/digilent.adept.sdk_$pkgver"

  incdst="$pkgdir/usr/local/include/digilent/adept"
  incsrc="inc"

  mkdir -p ${incdst} 
  cp -f ${incsrc}/*.h ${incdst}
  chmod 644 ${incdst}/*.h

  # EULA
  mkdir -p "$pkgdir/usr/share/licenses/adept-sdk"
  install -m 644 EULA "$pkgdir/usr/share/licenses/adept-sdk"

}

# vim:set ts=2 sw=2 et:
