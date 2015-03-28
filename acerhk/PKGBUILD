# Maintainer: robotanarchy

pkgname=acerhk
pkgver=0.5.35
_ubunturel=16~3~ubuntu15.04.1
pkgrel=30
pkgdesc="Hotkey module for old Acer/Medion Laptops (rfkill hard fix)"
arch=(i686)
url="https://launchpad.net/~gruenertee/+archive/ubuntu/acerhk"
license=('GPL')
backup="etc/modprobe.d/acerhk.conf"
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
install="acerhk.install"

# Original source code is down. This one for Ubuntu is patched
# to compile against a 3.x kernel anyway:
source=("http://ppa.launchpad.net/gruenertee/acerhk/ubuntu/pool/main/a/acerhk/acerhk_$pkgver-$_ubunturel.tar.xz"
	"acerhk.install"
	"acerhk.conf")
md5sums=('d250943c8e7145a5b80cfffe9d05d1fd'
         '653447b741f63f25ec298475cf5c52fc'
         '491ce6fb1d816a605a97d05f326ef810')


_kernver=$(uname -r)
build() {
	cd "$pkgname-$pkgver"
	make acerhk.ko
}

package() {
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/acerhk.ko" \
    "${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/block/acerhk.ko"
	gzip "${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/block/acerhk.ko"

	mkdir -p  "${pkgdir}/etc/modules-load.d"
	echo "acerhk" >> "${pkgdir}/etc/modules-load.d/acerhk.conf"
	install -Dm644 "${srcdir}/acerhk.conf" "${pkgdir}/etc/modprobe.d/acerhk.conf"
}

