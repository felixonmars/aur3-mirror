# Maintainer: Stefan Agner <stefan@agner.ch>

pkgname=dtc-dynamic
_gitname=dtc
pkgver=1.4.0_dynamic
pkgrel=2
pkgdesc="Device Tree Compiler with dynamic device tree (Symbols and Fixup) support"
url="http://jdl.com/software/"
conflicts=('dtc', 'dtc-git')
arch=('armv7h', 'x86_64')
license=('GPL2')
source=('git+http://jdl.com/software/dtc.git#tag=v1.4.0'
	'0001-dtc-Dynamic-symbols-fixup-support.patch'
	'0002-dtc-v-takes-no-argument-drop-extra.patch')
md5sums=('SKIP'
	'a4b3d26147fc04c0ba6fbe684a32e473'
	'd87e69d298adef82ed3ad760763ca818')

prepare() {
	cd ${_gitname}
	git am ${srcdir}/0001-dtc-Dynamic-symbols-fixup-support.patch
	git am ${srcdir}/0002-dtc-v-takes-no-argument-drop-extra.patch
}

build() {
	cd ${_gitname}
	make || return 1
}

package() {
	cd ${_gitname}

	make INSTALL=$(which install) DESTDIR=${pkgdir} PREFIX=/usr install || return 1
}

