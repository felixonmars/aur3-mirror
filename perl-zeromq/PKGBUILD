# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer : Viliam Pucik <viliam.pucik@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-zeromq'
pkgver='0.21'
pkgrel='1'
pkgdesc="A ZeroMQ2 wrapper for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.5.0' 'zeromq>=2.1.10')
makedepends=('perl-anyevent' 'perl-json>=2.0' 'perl-test-fatal' 'perl-test-requires' 'perl-test-tcp>=1.08' 'zeromq>=2.1.10')
url='http://search.cpan.org/dist/ZeroMQ'
source=("http://search.cpan.org/CPAN/authors/id/D/DM/DMAKI/ZeroMQ-${pkgver}.tar.gz")
md5sums=('05bc6bf6fca7c5eefebad428ffefda8e')
sha512sums=('5b128a2d5886745c2a1097b7444b3cba9a688dd1234a6a4e8434738cdb5bb9dccd408e5cffc05f59e5b8e0ff51154cb36d61912809849f340107da8d32e71539')
_distdir="${srcdir}/ZeroMQ-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

