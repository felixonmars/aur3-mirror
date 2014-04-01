# Maintainer: Andreas Schneider <aksdb@gmx.de>
pkgname=multigl-libgl
pkgver=0.1
pkgrel=1
pkgdesc="Scripts and utilities to manage multiple graphics drivers."
arch=('x86_64')
url="http://hg.aksdb.de/ArchLinux/multigl"
license=('GPL')
depends=('mesa')
optdepends=('lib32-mesa: for 32bit fallback (necessary for fglrx)')
provides=('libgl' 'mesa-libgl' 'lib32-libgl' 'lib32-mesa-libgl')
conflicts=('libgl' 'lib32-libgl')
source=(switchgl.sh multigl.service)
noextract=()

package() {
	install -m755 -d ${pkgdir}/usr/bin
	install -m755 ${srcdir}/switchgl.sh ${pkgdir}/usr/bin/switchgl
	
	install -m755 -d ${pkgdir}/usr/lib/systemd/system
	install -m644 ${srcdir}/multigl.service ${pkgdir}/usr/lib/systemd/system/multigl.service
}

md5sums=('14f239a1e07360e3323e8378225561c5'
         'b1a304556174948da23725bfe0b3fed7')
