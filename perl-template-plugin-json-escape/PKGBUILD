# Maintainer : Nigel Gourlay <ngourlay@gmail.com>

pkgname=perl-template-plugin-json-escape
_cpanname=Template-Plugin-JSON-Escape
pkgver=0.02
pkgrel=1
pkgdesc="Adds a .json vmethod and a json filter."
arch=('any')
url="http://search.cpan.org/~NANTO/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-template-toolkit>=2.20' 'perl-json>=2.12')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/N/NA/NANTO/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('e80fc7d043dd7df1e1fa2fd59090846a')
build() {
  cd $srcdir/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}
package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
