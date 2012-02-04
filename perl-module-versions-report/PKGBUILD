# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-module-versions-report
pkgver=1.06
pkgrel=1
pkgdesc='Report versions of all modules in memory'
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~jesse/Module-Versions-Report-$pkgver/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Module-Versions-Report-$pkgver.tar.gz")
md5sums=('9c7efaa4c3dd8eecceb8e5d17476479b')

build() {
	cd "$srcdir/Module-Versions-Report-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Module-Versions-Report-$pkgver"
	make install DESTDIR="$pkgdir"
}
