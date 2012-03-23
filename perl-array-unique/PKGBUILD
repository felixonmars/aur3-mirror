# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>
pkgname=perl-array-unique
pkgver=0.08
pkgrel=1
pkgdesc="Perl module for tie-able array that allows only unique values"
arch=(any)
url=http://search.cpan.org/~szabgab/Array-Unique/
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0') 
options=(!emptydirs)
changelog=Changes
source=(http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/Array-Unique-$pkgver.tar.gz)
md5sums=('e3fc4333a97c360348b8c7d0b6b94e83')

build() {
	cd "$srcdir/Array-Unique-$pkgver"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
	make || return 1
}

package() {
	cd "$srcdir/Array-Unique-$pkgver"
	make install DESTDIR=${pkgdir} || return 1
	# remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
