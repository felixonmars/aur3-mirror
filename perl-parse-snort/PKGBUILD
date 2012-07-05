# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-parse-snort'
pkgver='0.6'
pkgrel='1'
pkgdesc="Parse and create Snort rules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor')
makedepends=()
url='http://search.cpan.org/dist/Parse-Snort'
source=('http://search.cpan.org/CPAN/authors/id/R/RH/RHARMAN/Parse-Snort-0.6.tar.gz')
md5sums=('26eafe3d5981285f2f642946963e1e4f')
sha512sums=('097b120032ac7bfd5d3ee016fa7fb0ee2eef0f7b287a5a7db60fe39aaa4f7eb624c641ad80f9ab6ff703c483d5d09f9f58495a2112e56e12afbff60d05b9d388')
_distdir="${srcdir}/Parse-Snort-0.6"

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
