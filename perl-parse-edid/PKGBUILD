# Contributor: Kevin C <kiven at kiven.fr>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parse-edid'
pkgver='1.0.4'
pkgrel='1'
pkgdesc="Extended display identification data (EDID) parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml')
makedepends=()
url='http://search.cpan.org/dist/Parse-EDID'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GROUSSE/Parse-EDID-1.0.4.tar.gz')
md5sums=('847bb49668291992f5de832a1cd77cc2')
sha512sums=('5ca88fb90e4baddb1d5508555963a9a1f51f1e064f190bb7731c54afb3a094af8c3fe5ad6a568a640d546703c1a3b4c3c0fe33c1d6501cdc7f68250eea0dd5b3')
_distdir="Parse-EDID-1.0.4"

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
