# Maintainer: Stephan Friedrichs <stephan.friedrichs@tu-bs.de>

pkgname='polymake'
pkgver='2.12rc3'
pkgrel='1'
pkgdesc='A tool to study the combinatorics and the geometry of convex polytopes and polyhedra'
arch=('i686' 'x86_64')
url='http://polymake.org/'
license=('GPL2')
depends=('perl' 'gmp' 'mpfr' 'perl-xml-libxml' 'perl-xml-libxslt' 'perl-xml-writer')
makedepends=('boost')
optdepends=( \
	'java-environment>=5: jreality ' \
	'libgl: jreality' \
	'nvidia-cg-toolkit: jreality' \
	'jack: jreality' \
	)
source=("http://polymake.org/lib/exe/fetch.php/download/${pkgname}-${pkgver/rc/-rc}.tar.bz2")
sha256sums=('354a5220009882c178d8d98ec8c16921eea284ed73ff7d36c5fee787aa3f4796')

build() {
	cd "${srcdir}/${pkgname}-${pkgver/rc*/}"
	./configure --prefix=/usr --docdir="/usr/share/doc/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver/rc*/}"
	make DESTDIR="${pkgdir}" install
}
