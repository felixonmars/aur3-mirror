# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='perl-data-section-simple'
_cpanname='Data-Section-Simple'
pkgver='0.05'
pkgrel='1'
pkgdesc='Read data from __DATA__.'
arch=('any')
url="http://search.cpan.org/~miyagawa/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/$_cpanname-$pkgver.tar.gz")
md5sums=('082979ccfb4017bc952902d129887ce9')

# Function to change to the working directory and set
# environment variables to override undesired options.
prepareEnvironment() {
	cd "$srcdir/$_cpanname-$pkgver"
	export \
		PERL_MM_USE_DEFAULT=1 \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
}

build() {
	prepareEnvironment
	/usr/bin/perl Makefile.PL
	make
}

check() {
	prepareEnvironment
	make test
}

package() {
	prepareEnvironment
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
