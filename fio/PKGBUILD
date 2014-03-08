# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: John Williams <jwilliams4200 liamg reverse&remove moc>
pkgname=fio
pkgstr=2.1.6
pkgver=2.1
pkgrel=6
pkgdesc="Scriptable I/O tool for storage benchmarks and drive testing"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/fio"
license=('GPL2')
depends=('bash' 'libaio')
optdepends=('gfio: GTK2 frontend'
	    'gnuplot: generating plots using fio_generate_plots'
	    'numactl: NUMA support (must also be present at build time)')
source=("http://brick.kernel.dk/snaps/fio-${pkgstr}.tar.bz2")
sha256sums=('09918a31cf222bdf43c7fc6fde5489abe4391db97937c0204b4b175877ec7a6c')

build() {
	cd $srcdir/fio-${pkgstr}
	./configure
	make
}

package() {
	cd $srcdir/fio-${pkgstr}
	make DESTDIR="${pkgdir}" prefix="/usr" mandir="/usr/share/man" install

	# documentation
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 \
		HOWTO \
		LICENSE \
		README \
		REPORTING-BUGS \
		SERVER-TODO \
		"${pkgdir}/usr/share/doc/${pkgname}"

	# examples
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
	install -m644 examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
