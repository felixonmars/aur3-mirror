# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-extutils-command'
pkgver='1.17'
pkgrel='1'
pkgdesc="utilities to replace common UNIX commands in Makefiles etc."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/ExtUtils-Command'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/ExtUtils-Command-1.17.tar.gz')
md5sums=('8d2bd6a2311b6264d3dd96c11601c34a')
sha512sums=('69040173a839cd763673a45ae5897c25fdd581a598008a282cc7c42e0051ecdb29c2b608207e0e940b0b7bcf894d1f6344596d4aca319c5c094ca289615c6291')
_distdir="ExtUtils-Command-1.17"

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
