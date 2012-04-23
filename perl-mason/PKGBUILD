# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-mason
_cpanname="Mason"
pkgver=2.18
pkgrel=1
pkgdesc="Powerful, high-performance templating for the web and beyond"
arch=('any')
url="http://search.cpan.org/~jswartz/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0' 'perl-capture-tiny' 'perl-class-unload' 'perl-guard' 'perl-ipc-system-simple'
         'perl-method-signatures-simple' 'perl-moose' 'perl-test-class-most' 'perl-moosex-hasdefaults'
				 'perl-moosex-strictconstructor')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/$_cpanname-$pkgver.tar.gz")
md5sums=('c6bc7a120afc2ba8e222d2a75aadc0ff')

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
