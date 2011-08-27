# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Armin 'IsSuE' Praher [issue.at.gmx.dot.at]
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=teeworlds-isrv
pkgver=0.5.2
_bamver=0.2.0
pkgrel=3
pkgdesc="Teeworlds server with instagib patch"
arch=('i686' 'x86_64')
url="http://teeworlds.com"
license=('custom')
depends=('alsa-lib' 'mesa' 'sdl')
makedepends=('python2')
replaces=('teewars')
source=(http://www.teeworlds.com/files/teeworlds-${pkgver}-src.tar.gz
        http://www.teeworlds.com/files/bam-${_bamver}.tar.gz
        instagib-2.2.patch
        fix_datadir_search.patch
        autoexec.cfg)
md5sums=('f605f6df9f1714dcda4cba1d281cc757'
         'd4efe74591a73c1cec8b34d76ffd1049'
         '16a0b49d80d397a3ebe36033472cdcf4'
         '0b593a3771eb9db6d3ceb8d4bbf2af62'
         '95bb4b14ce1ef5290e56234032100c7a')

build() {
	# Build bam (used to build teewars)
	# Now it is released separately I should make a separate package...
	cd ${srcdir}/bam-${_bamver}
	./make_unix.sh

	# Build teeworlds
	cd ${srcdir}/teeworlds-${pkgver}-src

	# fix for FS 13118 which will be applied in next release
	patch -p1 -i ../fix_datadir_search.patch

	# Apply instagib patch
	patch -p0 -i ../instagib-2.2.patch || return 1

	# Use Python 2
	sed -i 's/python /python2 /' default.bam

	../bam-${_bamver}/src/bam server_release
}

package() {
	mkdir -p ${pkgdir}/usr/share/${pkgname}/data/maps
	cp -r ${srcdir}/teeworlds-${pkgver}-src/data/maps/* ${pkgdir}/usr/share/${pkgname}/data/maps || return 1
	cd ${srcdir}/teeworlds-${pkgver}-src
	# Install data files
	install -Dm755 ${srcdir}/teeworlds-${pkgver}-src/teeworlds_srv ${pkgdir}/usr/bin/teeworlds_isrv || return 1
	install -Dm644 ${srcdir}/teeworlds-${pkgver}-src/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
	install -Dm644 ${srcdir}/autoexec.cfg ${pkgdir}/usr/share/${pkgname}/data/autoexec.cfg || return 1

}
