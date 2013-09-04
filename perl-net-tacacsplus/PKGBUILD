# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-tacacsplus'
pkgver='1.10'
pkgrel='1'
pkgdesc="Tacacs+ library"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan' 'perl-class-accessor')
makedepends=('perl-test-differences')
url='http://search.cpan.org/dist/Net-TacacsPlus'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOUGDUDE/Net-TacacsPlus-1.10.tar.gz')
md5sums=('c07688089f71aa3f6579cf34f684c1ff')
sha512sums=('22856c0582bd9c280a32b446b2b58080a9dcf69b5674933ac8cf812c73a3144530df057805f7ea2d4f3c31a0d7d88f2594bd47fd0fbcc1b67d4b7c830d8922e1')
_distdir="Net-TacacsPlus-1.10"

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
