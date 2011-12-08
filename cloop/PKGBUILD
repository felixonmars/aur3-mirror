# Maintainer: maxiking333 <linuxmaxi@online.de>

pkgname=cloop
pkgver=2.639
pkgrel=2
pkgdesc=""
arch=(i686 x86_64)
url="http://www.knopper.net/projekte/"
license=('GPLv2')
depends=('zlib' 'linux-headers')
makedepends=()
source=(http://debian-knoppix.alioth.debian.org/packages/cloop/cloop_${pkgver}-2.tar.gz cloop.sh)
md5sums=('458d7cc0c69646a2caaedec5c836cdcc' '401e03bb94555b66cb2f2182c145f7c1')

build() {
	kernelver=$(uname -r)
	
	cd cloop-${pkgver}

	make KERNEL_DIR=/usr/src/linux-${kernelver}

	mkdir -p "${pkgdir}/usr/bin/"
	install -m 755 create_compressed_fs "${pkgdir}/usr/bin/"
	install -m 755 extract_compressed_fs "${pkgdir}/usr/bin/"

	mkdir -p "${pkgdir}/lib/modules/${kernelver}/misc"
	install -m 664 cloop.ko "${pkgdir}/lib/modules/${kernelver}/misc"

	mkdir -p "${pkgdir}/usr/src/cloop"
	install -m 644 debian/cloop-source/usr/src/modules/cloop/Makefile "${pkgdir}/usr/src/cloop"
	install -m 644 debian/cloop-source/usr/src/modules/cloop/cloop.mod.c "${pkgdir}/usr/src/cloop"
	install -m 644 debian/cloop-source/usr/src/modules/cloop/compressed_loop.c "${pkgdir}/usr/src/cloop"
	install -m 644 debian/cloop-source/usr/src/modules/cloop/compressed_loop.h "${pkgdir}/usr/src/cloop"

	mkdir -p "${pkgdir}/etc/rc.d"
	install -m 755 "${srcdir}/cloop.sh" "${pkgdir}/etc/rc.d/cloop"
}
