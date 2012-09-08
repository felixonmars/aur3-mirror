# Original AUR package by Smeagol
# Contributor: Moises Serrano <linkmoises at gmail dot com>

pkgname=banshee-remote-control
pkgver=4.0
pkgrel=1
pkgdesc="Remote Listener allows controling Banshee from another device on your local network."
arch=('i686', 'x86_64')
url="http://www.dartmouth.edu/~nstamato/BansheeRemoteListener.dll"
license="GPLv2"
depends=('banshee')
source=(http://www.dartmouth.edu/~nstamato/BansheeRemoteListener.dll)
md5sums=('d705e1f7da44b54b282c8ffe61891d36')

build() {
	mkdir ${pkgdir}/usr/
	mkdir ${pkgdir}/usr/lib/
	mkdir ${pkgdir}/usr/lib/banshee/
	mkdir ${pkgdir}/usr/lib/banshee/Extensions/
	cp BansheeRemoteListener.dll ${pkgdir}/usr/lib/banshee/Extensions/ 
}
