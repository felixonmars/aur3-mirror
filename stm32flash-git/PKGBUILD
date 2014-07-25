# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
pkgname=stm32flash-git
pkgver=0.125.f26ab72
pkgrel=1
pkgdesc="Open source flash program for the STM32 ARM processors using the ST bootloader."
arch=('i686' 'x86_64')
url="https://code.google.com/p/stm32flash/"
license=('GPL2')
makedepends=('git')
provides=('stm32flash-svn' 'stm32flash')
conflicts=('stm32flash-svn' 'stm32flash')
source=("git://gitorious.org/stm32flash/stm32flash.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/stm32flash
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}
build() {
	cd ${srcdir}/stm32flash
	make
}

package() {
	cd ${srcdir}/stm32flash
	make PREFIX=${pkgdir}/usr install
}
