# Contributor: T-T

pkgname='t-t_torpia'
pkgver='1.1'
pkgrel=0
pkgdesc="Automatize Torpia gaming"
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/tttorpia/home/Home/"
license=('GPL')
depends=(bash wget)
makedepends=()
conflicts=()
optdepends=()

source=("https://downloads.sourceforge.net/project/tttorpia/$pkgver/torpia.tar.xz")
md5sums=(855910544bb479de5f672f0ffc8224ee)

build() {
	cd ${srcdir}/
	
	mkdir ${pkgdir}/usr
	mkdir ${pkgdir}/usr/share
	mkdir ${pkgdir}/usr/share/torpia
	mkdir ${pkgdir}/etc
	mkdir ${pkgdir}/usr/bin
	
	mv ${srcdir}/torpia/start ${pkgdir}/usr/bin/torpia
	mv ${srcdir}/torpia/torpia ${pkgdir}/usr/share/torpia/
	mv ${srcdir}/torpia/torpia.conf ${pkgdir}/etc/
	for soubor in ${srcdir}/torpia/*; do
		[[ "$soubor" =~ (\.tar\.xz|install) ]] || mv "$soubor" ${pkgdir}/usr/share/torpia/
	done
}
