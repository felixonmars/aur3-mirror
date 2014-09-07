# Maintainer: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=powergadget
pkgver=2.5
pkgrel=1
pkgdesc="A software-based power usage monitoring tool enabled for 2nd Generation Intel Core processors or later."
url="https://software.intel.com/en-us/articles/intel-power-gadget/"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
source=("http://software.intel.com/sites/default/files/$pkgname.tgz"
		"$pkgname.conf")
md5sums=('995fc50d0c495e1b8ba1a88855fdb26b'
         'fee3bf609078e6b88ad6f8ee66322076')

build() {
	msg2 "Compiling..."
	cd power_gadget
	make all
}
package() {
	msg2 "Copying files to the correct places"
	install -D "$srcdir"/power_gadget/power_gadget "$pkgdir"/usr/bin/power_gadget
	install -D "$srcdir"/power_gadget/librapl.so "$pkgdir"/usr/lib/librapl.so
	install -Dm644 "$srcdir"/$pkgname.conf "$pkgdir"/usr/lib/modules-load.d/$pkgname.conf
	install -Dm644 "$srcdir"/power_gadget/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
