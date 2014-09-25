# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-jira-rest'
pkgver='0.009'
pkgrel='1'
pkgdesc="Thin wrapper around JIRA's REST API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-util>=0' 'perl-html-tree>=0' 'perl-http-message>=0' 'perl-json>=0' 'perl-rest-client>=0' 'perl-uri>=0' 'perl>=5.010')
makedepends=()
url='http://search.cpan.org/dist/JIRA-REST'
source=('http://search.cpan.org/CPAN/authors/id/G/GN/GNUSTAVO/JIRA-REST-0.009.tar.gz')
md5sums=('80ea2b372a471f85cc1a6d55db0e7533')
sha512sums=('ad611ca1bd1fb5b2bcaf14f756cf57a1d7db84ccdde570c5690f0ebf15d5cfac3ea70f257c4b82d4f909321369efa2ea6052c323d846544e71c36fb06aa526a3')
_distdir="JIRA-REST-0.009"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
