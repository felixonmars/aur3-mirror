# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-moosex-log-log4perl'
pkgver='0.46'
pkgrel='1'
pkgdesc="A Logging Role for Moose based on Log::Log4perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-any-moose>=0.12' 'perl-log-log4perl>=1.13')
makedepends=('perl-io-stringy' 'perl-moose>=0.65')
url='http://search.cpan.org/dist/MooseX-Log-Log4perl'
source=('http://search.cpan.org/CPAN/authors/id/L/LA/LAMMEL/MooseX-Log-Log4perl-0.46.tar.gz')
md5sums=('f065209914bb400f51d14b7716d06dde')
sha512sums=('713838b47e2dec7058f47314f9d950dde6585017969d03cdd968003f7faab4f235ebdd2df3eeaf58a1f96429557c5c4b23e6066ba96c9b1226aeebe91bd0593c')
_distdir="${srcdir}/MooseX-Log-Log4perl-0.46"

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
