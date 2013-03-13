# Contributor: Dominik Heidler <dheidler@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-text-microtemplate-extended'
pkgver='0.17'
pkgrel='1'
pkgdesc="Extended MicroTemplate"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-microtemplate>=0.18')
makedepends=()
url='http://search.cpan.org/dist/Text-MicroTemplate-Extended'
source=("http://search.cpan.org/CPAN/authors/id/T/TY/TYPESTER/Text-MicroTemplate-Extended-${pkgver}.tar.gz")
md5sums=('d093c32578ab26c737022b84b4e35029')
sha512sums=('898f14826ca1f4a146b8e9fc15dab3927c4f687b57cd9d8e4505993c4360121d07dd2e95ddda2eb7d165ff49b69b3ee2f6d7ff005749bee4d61865a01f4d5e9d')
_distdir="${srcdir}/Text-MicroTemplate-Extended-${pkgver}"

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
