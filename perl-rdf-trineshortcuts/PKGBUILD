# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.21

pkgname='perl-rdf-trineshortcuts'
pkgver='0.104'
pkgrel='1'
pkgdesc="totally unauthorised module for cheats and charlatans"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-file-slurp' 'perl-libwww' 'perl-rdf-query>=2.903' 'perl-rdf-query-client>=0.03' 'perl-rdf-rdfa-parser>=1.093' 'perl-rdf-trine>=0.130' 'perl-uri>=1.30' 'perl-yaml')
makedepends=('perl-module-signature>=0.66')
url='http://search.cpan.org/dist/RDF-TrineShortcuts'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-TrineShortcuts-0.104.tar.gz')
md5sums=('1d806f99d44fa0977de5ae6dac7bbece')
sha512sums=('1dc608ae198475fa0e7ab4183ec20cfd3ba2ca2505d36cb243fdb08e8f855b2ec8c7fa497d4d04e3ad1a932b923609ef7667703740b299ac58385c36806faef9')
_distdir="${srcdir}/RDF-TrineShortcuts-0.104"

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

#check() {
#  cd "$_distdir"
#  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
#    make test
#  )
#}

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
