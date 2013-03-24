# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-rdf-closure'
pkgver='0.001'
pkgrel='1'
pkgdesc="pure Perl RDF inferencing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-data-uuid' 'perl-datetime' 'perl-datetime-format-strptime' 'perl-datetime-format-xsd' 'perl-datetime-timezone' 'perl-error' 'perl-namespace-clean' 'perl-number-fraction' 'perl-parse-recdescent' 'perl-rdf-trine>=0.135' 'perl-uri' 'perl-xml-libxml>=1.94')
makedepends=('perl-test-rdf>=0.24')
url='http://search.cpan.org/dist/RDF-Closure'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-Closure-0.001.tar.gz')
md5sums=('be10cfe63d1937fd6d6b28690ea3f6cf')
sha512sums=('33dd916f08fc0e804152e5acfc72bda05597c263fb57d713fe99beb8631c45840aa5d1639ef9dfbf996cfc0212274a721f3ade1154740c7f74c4e070abbb61ff')
_distdir="${srcdir}/RDF-Closure-0.001"

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
