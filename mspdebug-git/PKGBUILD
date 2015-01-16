# Maintainer: Keerthan Jaic <jckeerthan at gmail dot com
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=mspdebug-git
pkgver=v0.22.r55.g7e04b31
pkgrel=2
pkgdesc="a free debugger for use with MSP430 MSUs"
arch=('i686' 'x86_64')
url="http://mspdebug.sourceforge.net/"
license=('GPL')
makedepends=('git')
depends=('libusb' 'readline' 'libusb-compat')
optdepends=(
  'mspds: enables tilib driver support. needed for msp430f5529,msp430fr5969'
)
provides=('mspdebug')
conflicts=('mspdebug')
source=("$pkgname::git://git.code.sf.net/p/mspdebug/code" "82-eZ430.rules")
md5sums=('SKIP'
         '21203da2d026fd178126ff11a1b00b92')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make PREFIX=/usr
} 

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir/usr" install
	install -D -m 0644 $srcdir/82-eZ430.rules $pkgdir/usr/lib/udev/rules.d/82-eZ430.rules
}
