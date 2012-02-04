# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=repeater_udp
pkgver=0.0.1
pkgrel=1
pkgdesc="Dump UDP data from a port to stdout and forward/relay UDP data to one or more UDP ports."
arch=(i686 x86_64)
url="http://rg42.org/oss/osc/start"
license=('GPL')
depends=('glibc')
source=("http://rg42.org/_media/oss/osc/$pkgname.c")
md5sums=('8fb8ac5630b2fa687018a7664a999c05')

build() {
  cd "$srcdir"

  gcc -o $pkgname $pkgname.c
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
