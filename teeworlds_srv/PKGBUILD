# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Armin 'IsSuE' Praher [issue.at.gmx.dot.at]
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=teeworlds_srv
pkgver=0.6.0
_bamver=0.2.0
pkgrel=1
pkgdesc="A multiplayer 2D shooter - server only"
arch=('i686' 'x86_64')
url="http://teeworlds.com"
license=('custom')
depends=()
makedepends=('python2' 'bam')
replaces=('teewars_srv')
conflicts=('teeworlds')
source=(http://www.teeworlds.com/files/teeworlds-${pkgver}-src.tar.gz)
md5sums=('4d6e5d0fb1b5f0bdf6c5c49714045ef1')

build() {
	# Build teeworlds
	cd ${srcdir}/teeworlds-${pkgver}-source

	bam server_release
}

package() {
	cd ${srcdir}/teeworlds-${pkgver}-source

	# Install data files
	mkdir -p ${pkgdir}/usr/share/teeworlds/data
	cp -r ${srcdir}/teeworlds-${pkgver}-source/data/* \
		${pkgdir}/usr/share/teeworlds/data

	install -Dm755 ${srcdir}/teeworlds-${pkgver}-source/${pkgname} \
		${pkgdir}/usr/bin/${pkgname}

	install -Dm644 ${srcdir}/teeworlds-${pkgver}-source/license.txt \
		${pkgdir}/usr/share/licenses/teeworlds/license.txt
}
