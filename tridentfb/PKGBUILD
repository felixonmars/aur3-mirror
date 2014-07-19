# Contributor: Maribu <m1a2r3i4.h5a6h7n@uni-muenster.de> <-- delete numbers

pkgname=tridentfb
_majorver=3
_minorver="$(uname -r | sed -e 's/[0-9].//' -e 's/.\([0-9]\)\+-\([0-9]\)\+-ARCH//')"
pkgver=3.15
pkgrel=1
pkgdesc="The tridentfb kernel module - a framebuffer for trident graphic cards"
url="http://www.kernel.org/doc/Documentation/fb/tridentfb.txt"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' "linux>=${pkgver}" "linux<${_majorver}.$((${_minorver} + 1))")
makedepends=('linux-headers')
srcurl="https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain"
source=('Makefile' "${srcurl}/drivers/video/fbdev/tridentfb.c")
md5sums=('f70956a336400379a597e765a4cbf5f0'  
         '61c2d1ebbbe1855e892a9060ea2c3c39')
install=$pkgname.install

_extramodules=extramodules-${pkgver}-ARCH

pkgver() {
	echo ${_majorver}.${_minorver}
}

build() {
	cd "${srcdir}"
	make
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/lib/modules/${_extramodules}/"
	install -m644 *.ko -t "${pkgdir}/usr/lib/modules/${_extramodules}/"
	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}

