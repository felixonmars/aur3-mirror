# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=fastboot-os
pkgver=20121022
pkgrel=1
pkgdesc="Open source version of fastboot"
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=('git')
provides=('fastboot')
conflicts=('fastboot')
url="https://android.googlesource.com/platform/system/core"
license=('Apache')
source=('Makefile')
md5sums=('656a63fa2e710c6a3dc472f7e5e4edc1')

_git_core="https://android.googlesource.com/platform/system/core"
_git_extras="https://android.googlesource.com/platform/system/extras"
_git_libselinux="https://android.googlesource.com/platform/external/libselinux"

build() {
	cd $srcdir
	git clone $_git_core
	git clone $_git_extras
	git clone $_git_libselinux
	mv Makefile core/fastboot
	cd core/fastboot
	make
}
package(){
	cd ${srcdir}/core/fastboot
	make DESTDIR=${pkgdir} install
}
