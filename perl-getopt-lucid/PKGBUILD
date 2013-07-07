# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-getopt-lucid'
pkgver='1.05'
pkgrel='1'
pkgdesc="Clear, readable syntax for command line processing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-class>=1.23' 'perl-exception-class-trycatch>=1.10')
makedepends=()
url='http://search.cpan.org/dist/Getopt-Lucid'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Getopt-Lucid-1.05.tar.gz')
md5sums=('10cc33983e788da16852fdaf6f291e27')
sha512sums=('e84a34e94caf34472efd9761e14a836a6e575a8498a4fd7e74f20a311b51dcf65d1be9b7a71dc896f1555a3544c3eb38883c42ab37abf80d94e52b6d1c855acc')
_distdir="Getopt-Lucid-1.05"

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
