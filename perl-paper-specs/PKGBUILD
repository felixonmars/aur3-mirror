# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Module author: Jon Allen
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-paper-specs'
pkgver='0.10'
pkgrel='3'
pkgdesc="Size and layout information for paper stock, forms, and labels."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Paper-Specs'
source=('http://search.cpan.org/CPAN/authors/id/J/JO/JONALLEN/Paper-Specs-0.10.tar.gz')
md5sums=('9015563658a30f9fcfd98f23bb88651b')
sha512sums=('4c621a400754187ce942f924bf35c005b14aeadafc2c853a0a82ac0bda2b10e2824556709f1fa0240e06cce7001838924e054e332c1186ac55fb773d2337039e')
_distdir="Paper-Specs-0.10"

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
