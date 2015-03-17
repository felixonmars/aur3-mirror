# Maintainer: Oemer Yildiz <oemer@systemfreund.com>

pkgname=perl-html-tableparser-systemfreund
pkgver=0.40
pkgrel=1
pkgdesc="Perl/CPAN Module HTML::TableParser : Extract data from an HTML table"
arch=("i686" "x86_64")
url="http://search.cpan.org/~djerius/HTML-TableParser/"
license=("GPL")
source=("http://search.cpan.org/CPAN/authors/id/D/DJ/DJERIUS/HTML-TableParser-${pkgver}.tar.gz")
md5sums=('6e6e7cff8a738afd3708ee14df714819')
depends=("perl-html-parser")

build() {
  cd HTML-TableParser-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/HTML-TableParser-${pkgver}"
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
