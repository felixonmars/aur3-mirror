# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='perl-locale-us'
_cpanname='Locale-US'
pkgver='2.112150'
pkgrel='1'
pkgdesc='Two letter codes for state identification in the United States and vice versa.'
arch=('any')
url="http://search.cpan.org/~tbone/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0')
checkdepends=('perl-data-section-simple')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/T/TB/TBONE/$_cpanname-$pkgver.tar.gz")
md5sums=('61adcf5097a87dea84c2a987f81cb2d9')

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
