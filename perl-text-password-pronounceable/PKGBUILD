# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-text-password-pronounceable
_cpanname="Text-Password-Pronounceable"
pkgver=0.30
pkgrel=2
pkgdesc='Generate pronounceable passwords'
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~tsibley/$_cpanname/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/T/TS/TSIBLEY/$_cpanname-$pkgver.tar.gz")
md5sums=('2a6a3c9197dfb5912f763c0c4f285b48')

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
