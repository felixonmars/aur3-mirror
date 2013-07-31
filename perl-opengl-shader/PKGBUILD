# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-opengl-shader'
pkgver='1.01'
pkgrel='5'
pkgdesc="copyright 2007 Graphcomp - ALL RIGHTS RESERVED"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-opengl>=0.56')
makedepends=()
url='http://search.cpan.org/dist/OpenGL-Shader'
source=('http://search.cpan.org/CPAN/authors/id/B/BF/BFREE/OpenGL-Shader-1.01.tar.gz')
md5sums=('7f76a8e20968472bde0f9cba94a61681')
sha512sums=('22071f12905e48ea0abb93cb1d1aa25109eff8005a315580af3fdff8f5fe7d73cec9f2e041877ebd31eeb3eef6f39d9dea80bb793a37b5dbd0c0c573de6ea60c')
_distdir="OpenGL-Shader-1.01"

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
