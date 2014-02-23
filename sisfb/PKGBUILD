# Contributor: Maribu <m1a2r3i4.h5a6h7n@uni-muenster.de> <-- delete numbers

pkgname=sisfb
_majorver=3
_minorver="$(uname -r | sed -e 's/[0-9].//' -e 's/.\([0-9]\)\+-\([0-9]\)\+-ARCH//')"
pkgver=3.13
pkgrel=1
pkgdesc="The sisfb kernel module - a framebuffer driver for sis graphic cards"
url="https://www.kernel.org/doc/Documentation/fb/sisfb.txt"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' "linux>=${pkgver}" "linux<${_majorver}.$((${_minorver} + 1))")
makedepends=('linux-headers')
srcurl="https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/video/sis"
source=('Makefile'
        "${srcurl}/sis_main.c"
        "${srcurl}/sis_main.h"
        "${srcurl}/sis_accel.c"
        "${srcurl}/sis_accel.h"
        "${srcurl}/init.c"
        "${srcurl}/init.h"
        "${srcurl}/init301.c"
        "${srcurl}/init301.h"
        "${srcurl}/initextlfb.c"
        "${srcurl}/sis.h"
        "${srcurl}/vgatypes.h"
        "${srcurl}/vstruct.h"
        "${srcurl}/initdef.h")
md5sums=('9b4d49c7bceca66a566a1f6e8b49051f'
         '0794c4d3bcab13cc86065cca00007537'
         'a20df8001f217fab92da860c465daf79'
         '705d5b0e3d25c0e4fd18a898104d33dd'
         'f8a844601f732f634466d4521341e5d7'
         'fb6a1fe15fc71f59743c8a00ed0a4f53'
         '8e7bf2d99b6d7bd783466d62f6edeb57'
         'a7bdee9d333794813ad711acf66687a2'
         '3db8ecefb26974742e6dbdd1157412e6'
         'e76b807114712a3bab8547a088ef38d6'
         'e215fef360de2b401a7f24c8cd90b2f3'
         '223caf5eff1a5fa97b256d124487d73c'
         '7b82e6891e54b9d721448a128f71fa65'
         'f95ecfb9b50d98aea3b44a05ad7054c7')
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


