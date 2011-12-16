# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-catalyst-runtime-5.80'
pkgver='5.80033'
pkgrel='1'
pkgdesc="The Catalyst Framework Runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.4' 'perl-b-hooks-endofscope>=0.08' 'perl-cgi-simple' 'perl-class-c3-adopt-next>=0.07' 'perl-data-dump' 'perl-data-optlist' 'perl-html-parser' 'perl-http-body>=1.06' 'perl-http-message' 'perl-http-request-ascgi>=1.0' 'perl-libwww' 'perl-list-moreutils' 'perl-moose>=1.03' 'perl-moosex-emulate-class-accessor-fast>=0.00903' 'perl-moosex-getopt>=0.30' 'perl-moosex-methodattributes' 'perl-moosex-role-withoverloading>=0.09' 'perl-moosex-types' 'perl-moosex-types-common' 'perl-mro-compat' 'perl-namespace-autoclean>=0.09' 'perl-namespace-clean>=0.13' 'perl-path-class>=0.09' 'perl-string-rewriteprefix>=0.004' 'perl-sub-exporter' 'perl-task-weaken' 'perl-text-simpletable>=0.03' 'perl-tree-simple>=1.15' 'perl-tree-simple-visitorfactory' 'perl-uri>=1.35')
makedepends=('perl-class-data-inheritable' 'perl-test-exception')
url='http://search.cpan.org/dist/Catalyst-Runtime'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Runtime-5.80033.tar.gz')
md5sums=('5f7571fbac0cbbaee97a1f3cd5456a91')
sha512sums=('61f0eedc62547b46586677b93763a7355886b776aabada7ce7d6572dc033233a4a4f81c192ba788e446a98a6b1fa2447f28042407408f0f042d252201caf7caf')
_distdir="${srcdir}/Catalyst-Runtime-5.80033"

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
