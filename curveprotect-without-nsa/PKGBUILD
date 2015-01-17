# Maintainer: vmalloc support@cyborg-connect.de
# Contributor: Tomas Kral <tomas.kral@gmail.com>
# This is experimental software suite which implements client-side DNSCurve and CurveCP protection.
# Use this software very carefully. Software is ready for experimentation, but not yet ready for production use.
pkgname=curveprotect-without-nsa
pkgver=20140115
pkgrel=00
pkgdesc="Curveprotect is a complex collection of tools for protecting wide range of internet services with CurveCP + DNSCurve."
arch=("any")
url="http://curveprotect.org"
license=("custom:PublicDomain")
depends=("daemontools" "ucspi-tcp")
makedepends=()
options=()
install=curveprotect.install
source=("http://mojzis.com/software/curveprotect/files/curveprotect-$pkgver.tar.bz2")
sha512sums=('d5f7fb4063e04096205e809d1c72277be9c8baee406f6d81d715cad74f335af730826c77f6a5567fdd1ea0e957d25aab477c78cc2ca821d663c04cb38c6e7d7b')


build() {

  #build
  cd "$srcdir/curveprotect-$pkgver"
  ./do

}

package() {
  cd "$srcdir/curveprotect-$pkgver"
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

