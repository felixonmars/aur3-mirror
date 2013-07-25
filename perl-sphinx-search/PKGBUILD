# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sphinx-search'
pkgver='0.28'
pkgrel='1'
pkgdesc="Sphinx search engine API Perl client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-dbi' 'perl-file-searchpath' 'perl-list-moreutils' 'perl-path-class')
makedepends=()
url='http://search.cpan.org/dist/Sphinx-Search'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJSCHUTZ/Sphinx-Search-0.28.tar.gz')
md5sums=('c7f49a7d90d68c733c9bb784fe22403a')
sha512sums=('6a97a18d04762bae72afd759d3cb7cf7a825fc098cb4a2f29be768d6abd3bcf20afe86211dbd473c589c2b8265570d49d55f521d9fe12f5250d77099455ac7cb')
_distdir="Sphinx-Search-0.28"

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
