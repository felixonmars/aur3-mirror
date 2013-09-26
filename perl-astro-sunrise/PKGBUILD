# Maintainer: nidhogg
pkgname=perl-astro-sunrise
_pkgname=Astro-Sunrise
pkgver=0.92
pkgrel=1
pkgdesc="Perl extension for computing the sunrise/sunset on a given day"
arch=(any)
url="http://search.cpan.org/~jforget/Astro-Sunrise-0.92/"
license=('custom')
depends=('perl' 'perl-datetime')
makedepends=()
options=(!emptydirs)
source=('http://search.cpan.org/CPAN/authors/id/J/JF/JFORGET/Astro-Sunrise-0.92.tar.gz' 'LICENSE')
md5sums=('d07ddeabbfac70e19408eeff93c973db'
         'd1d133a6b9bb64fb0df32ea385b13673')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	perl Makefile.PL
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
