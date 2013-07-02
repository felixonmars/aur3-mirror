# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-image-bmp
_cpanname="Image-BMP"
pkgver=1.17
pkgrel=1
pkgdesc="A simple Bitmap parser/viewer"
arch=('any')
url="http://search.cpan.org/dist/$_cpanname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVEOLA/Image/$_cpanname-$pkgver.tar.gz")
md5sums=('faf17757e6f0e2d4c033edd0ed3e1c43')

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
