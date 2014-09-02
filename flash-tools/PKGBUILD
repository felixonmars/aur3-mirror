pkgname=flash-tools
pkgver=0.4.1
pkgrel=1
pkgdesc="A set of Free Software utilities that allow you to flash and acquire data logs from Motorola P2k handsets"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://www.jerryweb.org/projects/flash-tools/"
source="https://www.jerryweb.org/public/files/flash-tools-0.4.1.tar.gz"
license=('GPL')
depends=('libusb')
makedepends=()
sha256sums=('2202e6e887071d82b33074764cf0c4ae0d76ef8541166a2b9dd1793c0aeb8ff6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
