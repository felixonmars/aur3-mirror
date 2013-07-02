# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-p5-palm
_cpanname="p5-Palm"
pkgver=1.012
pkgrel=1
pkgdesc="A set of Perl 5 modules for reading, manipulating, and writing the .pdb and .prc database files used by PalmOS devices such as the PalmPilot and its successors."
arch=('any')
url="http://search.cpan.org/dist/$_cpanname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/$_cpanname-$pkgver.tar.gz")
md5sums=('d58d20c96bf18db4c73644b6e7403f57')

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
