# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-de-ascii'
pkgver='0.11'
pkgrel='1'
pkgdesc="Perl extension to convert german umlauts to and from ascii"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-DE-ASCII'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BIGJ/Lingua-DE-ASCII-0.11.tar.gz')
md5sums=('4cb82ad6125408e485b3548c58f7b204')
sha512sums=('e654e54052fb62b246a5b2473d4b18a50981893f15e69f823c860873ab3eed7bec3f44f10fd5e297862bc7cffd244a150aba40c6e4cf0cce5c171d7409b8aafa')
_distdir="Lingua-DE-ASCII-0.11"

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
