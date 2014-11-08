# Maintainer: Stepan Usatiuk aka stepus53 <stepus53@gmail.com>
# Contributor: Stepan Usatiuk aka stepus53 <stepus53@gmail.com>

pkgname=mucs_pcb
pkgdesc="PCB autorouters"
pkgver=3.0.1
pkgrel=2
pkgdir=mucs_pcb

md5sums="52d0054762b77e84d790436b3e17a692"

arch=('i686' 'x86_64')

url=(http://apt.cs.manchester.ac.uk/projects/tools/mucs-pcb/)

license=('GPL')

depends=('termcap')

source=(http://apt.cs.manchester.ac.uk/ftp/pub/amulet/pcb/$pkgname-$pkgver.tar.gz)

build() {
	mkdir pkg
	cd "${pkgname}-${pkgver}"
	./configure --prefix="${pkgdir}/usr"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make install
}
