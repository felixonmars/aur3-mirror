# Maintainer: fishfish <chiizufish of the gmail variety>
pkgname=adept-utilities
pkgver=2.1.1
pkgrel=6
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

md5sums=('2bfcdc40cf12bf823ddf76e2d7bb5455')
[[ $CARCH == i686 ]] && md5sums[0]='8eb4717d0ca997fa6c5f812dc23ef5a1'

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

  # EULA
  mkdir -p "$pkgdir/usr/share/licenses/adept-utilities"
  install -m 644 EULA "$pkgdir/usr/share/licenses/adept-utilities"
}

# vim:set ts=2 sw=2 et:
