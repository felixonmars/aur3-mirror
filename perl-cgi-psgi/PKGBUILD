# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-cgi-psgi
_cpanname="CGI-PSGI"
pkgver=0.15
pkgrel=2
pkgdesc="Adapt CGI.pm to the PSGI protocol"
arch=('any')
url="http://search.cpan.org/~miyagawa/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/$_cpanname-$pkgver.tar.gz")
md5sums=('58a39711add2b48229710688c5f81cfd')

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
