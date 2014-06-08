# Maintainer: Konrad Borowski <glitchmr@myopera.com>
# Contributor: Joel Almeida <aullidolunar _at_ gmail dot c0m>

pkgname='perl-perl6-junction'
pkgver='1.60000'
pkgrel='1'
pkgdesc="Perl6 style Junction operators in Perl5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/~cfranks/Perl6-Junction-1.60000/'
_distname="Perl6-Junction-${pkgver}"
source=("http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/$_distname.tar.gz")
md5sums=('efe5ccaf8983cbb9f070e5ae4654adc2')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
