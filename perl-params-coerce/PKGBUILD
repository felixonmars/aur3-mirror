# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='perl-params-coerce'
_cpanname='Params-Coerce'
pkgver='0.14'
pkgrel='1'
pkgdesc='Allows your classes to do coercion of parameters.'
arch=('any')
url="http://search.cpan.org/~adamk/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/$_cpanname-$pkgver.tar.gz")
md5sums=('a8439ea6777c9156424ef6dd74c83945')

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
