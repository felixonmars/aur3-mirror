# Maintainer: Kevin Cox (youarefunny - ktcox@rogers.com)
# Contributor: Matias De la Puente (mfpuente.ar@gmail.com)
pkgname=cpik
pkgver=0.7.1
_pkgver=$(echo $pkgver | tr -d '.')
pkgrel=2
pkgdesc='The C compiler for PIC18 devices'
url='http://pikdev.free.fr/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('qt')
install=
source=("http://pikdev.free.fr/$pkgname-$pkgver-1.tar.gz")
md5sums=('bca70fd0a043fa1d5b492814091fa2b8')

build() {
	cd "${srcdir}/cpik-${pkgver}"	# Source Directory
	
	qmake -o Makefile "cpik${_pkgver}.pro"
	make
}

package() {
	cd "${srcdir}/cpik-${pkgver}"
	
	make INSTALL_ROOT=${pkgdir} install
	ln -s "/usr/bin/cpik-$pkgver" "${pkgdir}/usr/bin/cpik"
}

