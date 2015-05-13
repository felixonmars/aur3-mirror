# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

_localpkgver=Y
_pkgbase="x-tools"
pkgname=("${_pkgbase}-armv5" "${_pkgbase}-armv6h" "${_pkgbase}-armv7h")
pkgver=4.9.2
pkgrel=4
pkgdesc="An x-tools package for Arch Linux ARM"
arch=("x86_64")
url="http://archlinuxarm.org/developers/distcc-cross-compiling"
license=("GPL" )
options=("libtool" "emptydirs" "!strip")
source=(
	"alarm-x-tools5.tar.xz::http://archlinuxarm.org/builder/xtools/x-tools.tar.xz"
	"alarm-x-tools6.tar.xz::http://archlinuxarm.org/builder/xtools/x-tools6h.tar.xz"
	"alarm-x-tools7.tar.xz::http://archlinuxarm.org/builder/xtools/x-tools7h.tar.xz"
	"${_pkgbase}.tar.xz"
)
md5sums=(
	'abe09ecca53b0c7f103c0466f9413579'
	'6b95b0b1c47c66191501ab6918d70a6c'
	'ccbfa040c1949dad6d32505fa9d973b9'
	'817d78b216b3ce5046eae338de669a15'
)

package_x-tools-armv5() {
	install -dm755 "${pkgdir}/opt"
	cp -ar "${srcdir}/x-tools/arm-unknown-linux-gnueabi" "${pkgdir}/opt/alarm-x-tools-armv5"

	rm -rf "${pkgdir}/opt/alarm-x-tools-armv5/build.log.bz2"

	cd "${pkgdir}/opt/alarm-x-tools-armv5/bin"
	for f in $(ls --ignore=arm-unknown-linux-gnueabi-*)
	do
		rm "${f}"
	done
	for f in $(ls arm-unknown-linux-gnueabi-*)
	do
		mv "${f}" "$(echo "${f}" | sed "s/^arm/armv5tel/g")"
	done

	install -dm755 "${pkgdir}/usr/bin"
	for f in *
	do
		ln -s "/opt/alarm-x-tools-armv5/bin/$(basename "${f}")" "${pkgdir}/usr/bin/$(basename "${f}")"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/bin/xmake-armv5" "${pkgdir}/usr/bin/"
	ln -s "xmake-armv5" "${srcdir}/bin/make-armv5"

	install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
	install -Dm644 "${srcdir}/completions/xmake-armv5" "${pkgdir}/usr/share/bash-completion/completions/"

	#for qemu
	install -dm755 "${pkgdir}/etc/qemu-binfmt"
	ln -s "/opt/alarm-x-tools-armv5/arm-unknown-linux-gnueabi/sysroot" "${pkgdir}/etc/qemu-binfmt/arm"
}

package_x-tools-armv6h() {
	install -dm755 "${pkgdir}/opt"
	cp -ar "${srcdir}/x-tools6h/arm-unknown-linux-gnueabihf" "${pkgdir}/opt/alarm-x-tools-armv6h"

	rm -rf "${pkgdir}/opt/alarm-x-tools-armv6h/build.log.bz2"

	cd "${pkgdir}/opt/alarm-x-tools-armv6h/bin"
	for f in $(ls --ignore=arm-unknown-linux-gnueabihf-*)
	do
		rm "${f}"
	done
	for f in $(ls arm-unknown-linux-gnueabihf-*)
	do
		mv "${f}" "$(echo "${f}" | sed "s/^arm/armv6l/g")"
	done

	install -dm755 "${pkgdir}/usr/bin"
	for f in *
	do
		ln -s "/opt/alarm-x-tools-armv6h/bin/$(basename "${f}")" "${pkgdir}/usr/bin/$(basename "${f}")"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/bin/xmake-armv6h" "${pkgdir}/usr/bin/"
	ln -s "xmake-armv6h" "${srcdir}/bin/make-armv6h"

	install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
	install -Dm644 "${srcdir}/completions/xmake-armv6h" "${pkgdir}/usr/share/bash-completion/completions/"
}

package_x-tools-armv7h() {
	install -dm755 "${pkgdir}/opt"
	cp -ar "${srcdir}/x-tools7h/arm-unknown-linux-gnueabihf" "${pkgdir}/opt/alarm-x-tools-armv7h"

	rm -rf "${pkgdir}/opt/alarm-x-tools-armv7h/build.log.bz2"

	cd "${pkgdir}/opt/alarm-x-tools-armv7h/bin"
	for f in $(ls --ignore=arm-unknown-linux-gnueabihf-*)
	do
		rm "${f}"
	done
	for f in $(ls arm-unknown-linux-gnueabihf-*)
	do
		mv "${f}" "$(echo "${f}" | sed "s/^arm/armv7l/g")"
	done

	install -dm755 "${pkgdir}/usr/bin"
	for f in *
	do
		ln -s "/opt/alarm-x-tools-armv7h/bin/$(basename "${f}")" "${pkgdir}/usr/bin/$(basename "${f}")"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/bin/xmake-armv7h" "${pkgdir}/usr/bin/"
	ln -s "xmake-armv7h" "${srcdir}/bin/make-armv7h"

	install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
	install -Dm644 "${srcdir}/completions/xmake-armv7h" "${pkgdir}/usr/share/bash-completion/completions/"
}
