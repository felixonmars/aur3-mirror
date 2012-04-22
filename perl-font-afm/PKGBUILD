# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-font-afm
_cpanname="Font-AFM"
pkgver=1.20
pkgrel=3
pkgdesc="Parse Adobe Font Metric files"
arch=('any')
url="http://search.cpan.org/~GAAS/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/$_cpanname-$pkgver.tar.gz")
md5sums=('b14ecf4dc4edbd63940aa354eb13c499')

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
