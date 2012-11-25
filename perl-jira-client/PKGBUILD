# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-jira-client'
pkgver='0.40'
pkgrel='1'
pkgdesc="An extended interface to JIRA's SOAP API."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-soap-lite' 'perl-data-util')
makedepends=()
url='http://search.cpan.org/dist/JIRA-Client'
source=("http://search.cpan.org/CPAN/authors/id/G/GN/GNUSTAVO/JIRA-Client-$pkgver.tar.gz")
md5sums=('f9985a98910519bbcf9e5555dfc257aa')
_distdir="${srcdir}/JIRA-Client-$pkgver"

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
