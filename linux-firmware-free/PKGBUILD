# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=linux-firmware-free
pkgver=3.1
pkgrel=2
pkgdesc='Free Firmware files for Linux'
arch=('any')
url='http://svn.debian.org/wsvn/kernel/dists/trunk/firmware-free/'
license=('GPL2' 'GPL3' 'MPL')
provides=('linux-firmware')
conflicts=('linux-firmware')
replaces=('linux-firmware')
source=(http://ftp.debian.org/debian/pool/main/f/firmware-free/firmware-free_$pkgver.tar.gz)
md5sums=('8f111229d121f447a4b6ea58cb897e00')

package() {
	cd $srcdir/firmware-free/linux-free
	rm defines
	install -d $pkgdir/usr/share/licenses/$pkgname
	mv LICENSE $pkgdir/usr/share/licenses/$pkgname/WHENCE
	install -d $pkgdir/usr/lib/firmware
	mv * $pkgdir/usr/lib/firmware
}
