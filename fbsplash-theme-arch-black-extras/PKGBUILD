# Contributor: PirateJonno <j@skurvy.no-ip.org>

pkgname=fbsplash-theme-arch-black-extras
pkgver=1.2
pkgrel=8
pkgdesc='Extra resolutions and tools for arch-black'
arch=('i686' 'x86_64')
license='CCPL:cc-by-nc-sa'
url='http://www.opendesktop.org/content/show.php?content=118524'
depends=('fbsplash-theme-arch-black')
source=("http://opendesktop.org/CONTENT/content-files/118524-arch-black-extras.tar.xz")
sha256sums=('e883b22cb1b5bafa89ff8b5b012a26b5ab1886fbc07c7d257556cc64efa0e7bb')

build() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/arch-black" .
	
	mkdir -p "${pkgdir}/usr/share"
	cd "${pkgdir}/usr/share"
	cp -a "${srcdir}/fbsplash-theme-arch-black" .
}
