# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-moosex-hasdefaults
_cpanname="MooseX-HasDefaults"
pkgver=0.03
pkgrel=2
pkgdesc='default "is" to "ro" or "rw" for all attributes'
arch=('any')
url="http://search.cpan.org/~sartak/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/$_cpanname-$pkgver.tar.gz")
md5sums=('589eb4d7a841e8824d8a24fa92ade369')

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
