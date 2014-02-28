# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-bot-training-starcraft'
pkgver='0.02'
pkgrel='1'
pkgdesc="Provide starcraft.trn via Bot::Training"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0' 'perl-bot-training>=0')
makedepends=()
url='http://search.cpan.org/dist/Bot-Training-StarCraft'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Bot-Training-StarCraft-0.02.tar.gz')
md5sums=('9ca72a69244484c265d3079f654e35db')
sha512sums=('da10970d97943a5190e66bad20c83fb954a97ce5f946001b3ff4a47929f1d037d9f4ddb5f66ec78538344fb0f14588dbce6ec011cfb89b943019914122a4daab')
_distdir="Bot-Training-StarCraft-0.02"

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
