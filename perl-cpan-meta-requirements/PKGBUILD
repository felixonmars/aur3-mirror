# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-cpan-meta-requirements'
pkgver='2.125'
pkgrel='1'
pkgdesc="a set of version requirements for a CPAN dist"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/CPAN-Meta-Requirements'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/CPAN-Meta-Requirements-2.125.tar.gz')
md5sums=('1cb395d655f47e28640374a196300ef2')
sha512sums=('78fe6237012ed8c4ba06fce2205dbf7d65e26bd9e9ef263aa5329dbce671f1c6630f30b4c443af0ed6d9289c4711d03924bd4bfbdea48d841ec4a3b24e448de4')
_distdir="CPAN-Meta-Requirements-2.125"

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
