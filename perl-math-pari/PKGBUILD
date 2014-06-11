# Contributor: Erik Johnson (palehose at gmail dot com)

pkgname=perl-math-pari
_archive_name=Math-Pari
pkgver="2.010808"
pkgrel=1
pkgdesc="Perl interface to PARI"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~ilyaz/${_archive_name}-${pkgver}/Pari.pm"
license=('GPL Artistic')
depends=('perl>=5.14.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILYAZ/modules/${_archive_name}-${pkgver}.zip")
md5sums=('4f1e2583caff40c502d01e6a2a46940e')

build() {
	cd "$srcdir/${_archive_name}-$pkgver"

	# install module in vendor directories.
	echo -e "y\n" | perl Makefile.PL installdirs=vendor
	make && make test
}

package() {
	cd "$srcdir/${_archive_name}-$pkgver"

	make install DESTDIR=${pkgdir}

	find ${pkgdir} -name '.packlist' -delete
	find ${pkgdir} -name '*.pod' -delete
}
