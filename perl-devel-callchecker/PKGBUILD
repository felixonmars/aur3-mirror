# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='perl-devel-callchecker'
_cpanname='Devel-CallChecker'
pkgver='0.005'
pkgrel='1'
pkgdesc='Provides a C API, for XS modules, concerned with custom parsing.'
arch=('i686' 'x86_64')
url="http://search.cpan.org/~zefram/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=(
	'perl-dynaloader-functions'
	'perl>=5.5.0'
)
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/$_cpanname-$pkgver.tar.gz")
md5sums=('2e55804221eaa5fdf2e32749b72e74f2')

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
