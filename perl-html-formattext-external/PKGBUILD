pkgname=perl-html-formattext-external
pkgver=19
pkgrel=1
pkgdesc="Format HTML as plaintext using W3m"
arch=('any')
url="http://search.cpan.org/dist/HTML-Format/"
license=('GPL')
depends=('perl>=5.10.0' 'w3m')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/HTML-FormatExternal-$pkgver.tar.gz")
md5sums=('71a84a15ad0d533f05390483617d992d')

build() {
  cd "$srcdir/HTML-FormatExternal-$pkgver"
  perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
  make destdir="$pkgdir/" install
}

package() {
  cd "$srcdir/HTML-FormatExternal-$pkgver"
  make destdir="$pkgdir/" install
}
