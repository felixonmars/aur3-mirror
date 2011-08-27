# Maintainer: Martin Imobersteg <imm@gmx.ch>
pkgname=perl-unicode-map8
pkgver=0.12
pkgrel=2
pkgdesc="Perl/CPAN Module Unicode::Map8 : Mapping table between 8-bit chars and Unicode."
arch=("i686" "x86_64")
url="http://search.cpan.org/~gaas/Unicode-Map8-${pkgver}/Map8.pm"
license=("GPL")
depends=('perl-unicode-string')
source=("http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Unicode-Map8-${pkgver}.tar.gz")
md5sums=('b76a10615258894b1699b140f93940d0')
build() {
  cd $startdir/src/Unicode-Map8-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make pure_install doc_install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}

