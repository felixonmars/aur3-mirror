# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=perl-text-asciimathml
_pkgname=Text-ASCIIMathML
pkgver=0.81
pkgrel=1
pkgdesc="Text::ASCIIMathML - parser of ASCIIMathML text into MathML"
url="http://search.cpan.org/perldoc?Text::ASCIIMathML"
license=('PerlArtistic' 'GPL')
arch=('any')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/N/NO/NODINE/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0f33523d93d9156e94931ed07d9836d7')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	make install
}

