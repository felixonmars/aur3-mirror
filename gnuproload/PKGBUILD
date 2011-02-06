# Contributor: b4283 <damispirit [] gmail [] com>

pkgname=gnuproload
pkgver=2.0
pkgrel=1
pkgdesc='gnuProload is a tool for programming the AT89S52 microcontroller over Linux.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/gnuproload/'
license=('GPL')
depends=('gtk2')
source=("http://downloads.sourceforge.net/project/gnuproload/gnuProload/gnuProload-2.0/gnuProload-2.0.tar.gz")
md5sums=('7f2bd2918e827695cad793a133137ba7')

build() {
	cd "${srcdir}/gnuProload-${pkgver}"
	./configure --prefix=/usr && make || return 1
	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/doc"
}

