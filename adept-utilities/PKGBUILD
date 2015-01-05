# Maintainer: fishfish <chiizufish of the gmail variety>
pkgname=adept-utilities
pkgver=2.2.1
pkgrel=1
pkgdesc="utilities to manage and communicate with Digilent's devices"
arch=('i686' 'x86_64')
url="http://www.digilentinc.com/Products/Detail.cfm?Prod=ADEPT2"
license=('custom')
depends=('adept-runtime')
install=adept-utilities.install

# to make sure a valid URL shows up on the AUR page
# (from Dropbox PKGBUILD)
_arch=x86_64
[[ $CARCH == i686 ]] && _arch=i686
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.utilities_${pkgver}-${_arch}.tar.gz")

md5sums=('654b9c4b8b4c3d3a21fc103b201fd756')
[[ $CARCH == i686 ]] && md5sums[0]='836eaa27442b7cfb1d2d3bff7871829c'

package() {
  cd "$srcdir/digilent.adept.utilities_$pkgver-$CARCH"

  mkdir -p "$pkgdir/usr/bin"
  if [[ $CARCH == i686 ]]; then
    install -m 755 bin/* "$pkgdir/usr/bin/"
  elif [[ $CARCH == x86_64 ]]; then
    install -m 755 bin64/* "$pkgdir/usr/bin/"
  fi
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m 644 man/* "$pkgdir/usr/share/man/man1"

  # bitstreams
  mkdir -p "$pkgdir/usr/share/digilent/dsumecfg/bitstreams"
  install -m 644 bitstreams/dsumecfg/* "$pkgdir/usr/share/digilent/dsumecfg/bitstreams/"

  # EULA
  mkdir -p "$pkgdir/usr/share/licenses/adept-utilities"
  install -m 644 EULA "$pkgdir/usr/share/licenses/adept-utilities"
}

# vim:set ts=2 sw=2 et:
