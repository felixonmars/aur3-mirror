# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=cross-arm-elf-base
pkgver=0.1
pkgrel=1
pkgdesc="You need this package to build cross-arm-elf-gcc. After your build it replace this package with cross-arm-elf-newlib"
arch=('any')
url="http://www.gnuarm.com/"
license=('GPL')
depends=('newlib-headers')

build() {
 mkdir -p ${pkgdir}/usr/arm-elf/include
 ln -s /usr/include/newlib/libc/* ${pkgdir}/usr/arm-elf/include
}
