# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-test-class-most
_cpanname="Test-Class-Most"
pkgver=0.06
pkgrel=1
pkgdesc="Test Classes the easy way"
arch=('any')
url="http://search.cpan.org/~ovid/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0' 'perl-test-most' 'perl-test-class')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/O/OV/OVID/$_cpanname-$pkgver.tar.gz")
md5sums=('e8cfddab4278dcd7d59df005336e2a0f')

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
