# Maintainer: 
# Contributor: 

pkgname=perl-lingua-en-pluraltosingular
_cpanname="Lingua-EN-PluralToSingular"
pkgver=0.14
pkgrel=1
pkgdesc="Change an English plural to a singular"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/$_cpanname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BK/BKB/$_cpanname-$pkgver.tar.gz")
sha512sums=('47b26925073856a280d0ebe558527e27fbf76ebb6a475c9197d3e7adceadffe9e9fa6a6519b2c01b58a8874f43c31c4e06c2022b41cd5a08020a0205595fda54')

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
