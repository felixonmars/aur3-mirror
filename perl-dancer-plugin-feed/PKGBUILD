# Contributor: Natal Ngétal <hobbestigrou@erakis.im>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-dancer-plugin-feed'
pkgver='0.6'
pkgrel='1'
pkgdesc="easy to generate feed rss or atom for Dancer applications."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dancer>=1.2001' 'perl-xml-feed')
makedepends=()
url='http://search.cpan.org/dist/Dancer-Plugin-Feed'
source=('http://search.cpan.org/CPAN/authors/id/H/HO/HOBBESTIG/Dancer-Plugin-Feed-0.6.tar.gz')
md5sums=('7622d55c7be3d245ec673176424072c8')
sha512sums=('76db47bd012f5566d12f65233edc705187f3174eca71109e553d71416167e7630d970781335071d5ce6bf5097073fd1db0d8a61659a74166848f4fe772c9cf54')
_distdir="${srcdir}/Dancer-Plugin-Feed-0.6"

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
