# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>
# Modified by: Marc St-Laurent <mstlaurent@canada.com>

pkgname=libslack
pkgver=0.5.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A library of general utilities designed to make UNIX/C programming easier on the eye"
depends=('glibc')
makedepends=('gzip' 'perl') # required to install manpages
url="http://libslack.org"
source=(http://libslack.org/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('9942170b2fba9482ec01e80bafd6adcd')
license=('GPL')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr || return 1
	make || return 1

	# This package has a bug: make install must be run 
	# twice in order to work.
	make PREFIX=${pkgdir}/usr install &> /dev/null 
	make PREFIX=${pkgdir}/usr install || return 1
}

