# Maintainer: Bruno Adele <bruno.adele#jesuislibre.org>
pkgname=iplc
pkgver=2005.1
pkgrel=1
pkgdesc="Insteon PLC device drivers for the Linux Kernel v2.4 and v2.6."
arch=('i686' 'x86_64')
_extramodules=extramodules-3.3-ARCH
url="http://www.linuxha.com/athome/common/iplcd/"
license=('GPL')
groups=()
depends=(linux)
makedepends=('gcc  linux-headers') #base-devel
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.linuxha.com/common/$pkgname/$pkgname-driver.tgz http://www.absurde.org/wp-content/uploads/2011/10/iplc-2.6.36.patch_.txt kernel3.patch)
noextract=()
sha256sums=('9cdc869173289e82d15ac9387c54c51a2a942d60d7931cd774aaf33f96ded474'
            '79cc956e08c788ba88fad61d4916f733b8118371e752e204cb133478d23f9213'
            '3d94555e53436d4d6d3132afdb70b664cbfb366489718757ded83d667f2fcc5a')
build() {
	cd "$srcdir/$pkgname/driver/linux-2.6"
	patch device.c < $startdir/iplc-2.6.36.patch_.txt
	patch device.c < $startdir/kernel3.patch

	# Build
	make -f Makefile.cm15a
	make cm15a
	make DESTDIR="${pkgdir}" moduledir="/lib/modules/${_extramodules}"
}

package() {
	cd "$srcdir/$pkgname/driver/linux-2.6/cm15a.d"

	install -D -m 755 cm15a.ko "${pkgdir}/lib/modules/${_extramodules}/cm15a.ko"
	gzip "${pkgdir}/lib/modules/${_extramodules}/cm15a.ko"
}
