# Maintainer: Thermionix <pirea.radu@gmail.com>

pkgname=sunxi-awusb-dkms
pkgver=0.5
pkgrel=1
pkgdesc="dkms module for Allwinner devices"
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-livesuite"
license=('GPL')
depends=('dkms' 'linux>=3.7')
makedepends=('git' 'linux-headers')
conflicts=()
install="${pkgname}.install"
source=("$pkgname"::'git+https://github.com/linux-sunxi/sunxi-livesuite.git'
	'sunxi-awusb-dkms.install')
sha256sums=('SKIP'
            '4664b472abc9b916ac05e49c4da49e24758af978d53d4a15acac90c455b4a8db')

build() {
	warning "Please make sure the current kernel version matches the available linux-headers version"
}

package() {
	mkdir -p "$pkgdir/usr/src/awdev-0.5"
	
	cp "$srcdir/$pkgname/awusb/"* "$pkgdir/usr/src/awdev-0.5"
}
