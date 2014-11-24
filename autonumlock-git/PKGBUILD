#!/bin/bash
# Maintainer: Ondrej Hruska <ondra@ondrovo.com>

_pkgname="autonumlock"
pkgname="autonumlock-git"

pkgver=a115f7e
pkgrel=1

pkgdesc="Script for watching for external keyboard and enabling numlock when connected. Useful for laptops that lack numeric block. Can also be used to alter keyboard layout and run arbitrary scripts, using the config file."
arch=("any")
url="https://github.com/MightyPork/autonumlock"
license=("MIT")

depends=(bash usbutils numlockx)

makedepends=("git")

source=("git+https://github.com/MightyPork/autonumlock.git")
provides=($_pkgname)
replaces=($_pkgname)
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's|-|.|g'
}

package() {
	# install license

	srcd="${srcdir}/${_pkgname}/"

	install -Dm 644 $srcd"LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	mkdir "${pkgdir}/usr/share/${_pkgname}/"

	cp -p $srcd"autonumlock" "${pkgdir}/usr/share/${_pkgname}/"
	cp -p $srcd"default_config" "${pkgdir}/usr/share/${_pkgname}/"

	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/usr/share/${_pkgname}/autonumlock" "${pkgdir}/usr/bin/autonumlock"
}
