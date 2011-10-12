# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-mason-plugin-psgihandler
pkgver=0.06
pkgrel=1
pkgdesc="Create a skeleton Mason/PSGI site"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~jswartz/Mason-Plugin-PSGIHandler-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-sharedir-install' 'perl-mason' 'perl-plack')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/Mason-Plugin-PSGIHandler-$pkgver.tar.gz")
md5sums=('8282c7f4d852a6e8fc9b99db054d261e')

build() {
	cd "$srcdir/Mason-Plugin-PSGIHandler-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Mason-Plugin-PSGIHandler-$pkgver"
	make install DESTDIR="$pkgdir"
}
