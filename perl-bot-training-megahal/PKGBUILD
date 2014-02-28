# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-bot-training-megahal'
pkgver='0.02'
pkgrel='1'
pkgdesc="Provide megahal.trn via Bot::Training"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0' 'perl-bot-training>=0')
makedepends=()
url='http://search.cpan.org/dist/Bot-Training-MegaHAL'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Bot-Training-MegaHAL-0.02.tar.gz')
md5sums=('49b42ba0d0c3f34e6df26ce76120e505')
sha512sums=('a4b4fa4ad652012a3486a5d3630403e5620f36f130292e8633390eb939997c9bf71f8361bc3aad59f05b52b260ef13190993d8ed304dff18460d3087815629c1')
_distdir="Bot-Training-MegaHAL-0.02"

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
