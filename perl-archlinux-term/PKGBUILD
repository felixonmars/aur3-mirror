# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.10

pkgname='perl-archlinux-term'
pkgver='0.03'
pkgrel='1'
pkgdesc="Print messages to the terminal in Archlinux style"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Archlinux-Term'
source=('http://search.cpan.org/CPAN/authors/id/J/JU/JUSTER/Archlinux-Term-0.03.tar.gz')
md5sums=('6f05efa512414b89a55d9f6de5b55a77')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Archlinux-Term-0.03"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "$DIST_DIR"
  $PERL Makefile.PL
  make
  make test
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
