# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-crypt-random'
pkgver='1.25'
pkgrel='1'
pkgdesc="Cryptographically Secure, True Random Number Generator. "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-loader>=2.00' 'perl-math-pari>=2.001804')
makedepends=()
url='http://search.cpan.org/dist/Crypt-Random'
source=('http://search.cpan.org/CPAN/authors/id/V/VI/VIPUL/Crypt-Random-1.25.tar.gz')
md5sums=('5730c9d5acdd698790216d354ffb0513')
sha512sums=('6c62e64a46d31aa7ef9caecb4e4535bfded9c62fc5156bc9c6390a019ea5d29772bcb1029889b111af6727d756d00ce0cc9407fc50ba7a31941d921c43df5fb7')
_distdir="Crypt-Random-1.25"

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
