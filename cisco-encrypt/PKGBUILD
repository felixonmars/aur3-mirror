# Maintainer: count-corrupt <corrupt at giggedy dot de>

pkgname=cisco-encrypt
pkgver=1.0
pkgrel=1
pkgdesc='Password encoder vor Cisco VPN client'
url='http://staff.science.uva.nl/~bakkerr/obfuscate.c'
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('libgcrypt>=1.1.90')
source=('http://staff.science.uva.nl/~bakkerr/obfuscate.c')
md5sums=('5288b525b93b1b9de1d3b60c0c1eadba')

build() {
	cd "${srcdir}"
	gcc -Wall -o "${pkgname}" obfuscate.c $(libgcrypt-config --libs --cflags)
}

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
