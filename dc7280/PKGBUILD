# Submitter:   Christoph Ketelsen <christoph dot ketelsen at gmail dot com>

pkgname=dc7280
pkgver=1.0
pkgrel=5
pkgdesc="Kernel module for Highpoint DataCenter 7280 3Gb/s SATA Host Adapter"
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA_new/cs-series_DC7280.htm"
license=('custom')
groups=()

depends=('linux')
makedepends=('linux-headers')

provides=('dc7280')
install=${pkgname}.install

source=(http://www.highpoint-tech.com/BIOS_Driver/DC7280/driver/Linux/dc7280-linux-src-v1.0-110621-1313.tar.gz dc7280.patch)
noextract=()
md5sums=('08f7790f46c59d82a7cebac61c00d889' '61f97d724076d78eafb9b84262e2f9bb')

_kernver="$(uname -r)"

build() {
	
	cd ${srcdir}/dc7280-linux-src-v1.0
	patch -p1 -i ${startdir}/dc7280.patch

	cd ${srcdir}/dc7280-linux-src-v1.0/product/dc7280/linuxla/
        make KERNEL_VER=2.6 || return 1
}

package() {

	mkdir -p ${pkgdir}/usr/lib/modules/${_kernver}/drivers/scsi/dc7280

	install -m0644 -D ${srcdir}/dc7280-linux-src-v1.0/product/dc7280/linuxla/dc7280.ko ${pkgdir}/usr/lib/modules/${_kernver}/drivers/scsi/dc7280
	gzip "${pkgdir}/usr/lib/modules/${_kernver}/drivers/scsi/dc7280/dc7280.ko"

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -m0644 -D ${srcdir}/dc7280-linux-src-v1.0/README ${pkgdir}/usr/share/licenses/${pkgname}/README
}

