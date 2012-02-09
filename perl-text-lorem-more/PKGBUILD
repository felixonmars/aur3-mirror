# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-text-lorem-more'
pkgver='0.13'
pkgrel='1'
pkgdesc="Generate formatted nonsense using random Latin words."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-parse-recdescent')
makedepends=('perl-extutils-makemaker>=6.62' 'perl-test-most')
url='http://search.cpan.org/dist/Text-Lorem-More'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKRIMEN/Text-Lorem-More-0.13.tar.gz')
md5sums=('83e350a101b785ffc28e17a57d942d2e')
sha512sums=('7bafc61506e69e61633e8bf0c6473afb7923a7c1740d198e56f549eb34f9c690344b32b52dfa8f7156f9b29e126630e3bcd687e8c4874df3033f3b7e2389c928')
_distdir="${srcdir}/Text-Lorem-More-0.13"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
