pkgname=cdi2nero
pkgver=0.9.9
pkgrel=2
pkgdesc="A simple utility to convert a DiscJuggler image to a Nero NRG image."
arch=('i686' 'x86_64')
url="http://digitalimagecorp.de/software/cdi2nero/"
license=('unknown')
depends=()
source=(http://digitalimagecorp.de/files/cdi2nero/linux/x86/cdi2nero)
md5sums=('e65b5b980121c0f3532d39c9ffa4a63d')
[ "${CARCH}" = "x86_64" ] && source[0]="http://digitalimagecorp.de/files/cdi2nero/linux/x86_64/cdi2nero"
[ "${CARCH}" = "x86_64" ] && md5sums[0]='8940c83a425a51199bae331db8f73e84'

build() {
  cd $srcdir
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
