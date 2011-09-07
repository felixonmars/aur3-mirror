# Contributor: minimalist <minimalist@lavabit.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-email-queue'
pkgver='0.01'
pkgrel='1'
pkgdesc="schedule email messages to be sent one by one at a later time."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-email-simple')
makedepends=('perl-test-deep' 'perl-test-time')
url='http://search.cpan.org/dist/Email-Queue'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MINIMAL/Email-Queue-0.01.tar.gz')
md5sums=('0c3efa138bfcb487fe421f20e38823ce')
sha512sums=('7548b4db7b8bccac87e42773d02bf9383373894b1421b88617d36654a48f87c77f716438a3e0636aaa71518977dbc01b259265109cacb4b13473ee4fbf281560')
_distdir="${srcdir}/Email-Queue-0.01"

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
