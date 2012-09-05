# Maintainer: Dominik George <nik@naturalnet.de>
# Shamelessly copied from perl-xml-writer

pkgname=perl-lingua-romana-perligata
_cpanname=Lingua-Romana-Perligata
pkgver=0.50
pkgrel=1
pkgdesc="Perl in Latin"
arch=('any')
url="http://search.cpan.org/dist/${_cpanname}"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/D/DC/DCONWAY/${_cpanname}-$pkgver.tar.gz) 
md5sums=('9bc5665aa568d4f7ca1a9c07c3465a0c')

build() {
  cd  ${srcdir}/${_cpanname}-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  ${srcdir}/${_cpanname}-$pkgver

  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
