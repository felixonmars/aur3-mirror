# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-linux-joystick'
pkgver='0.0.1'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Linux-Joystick'
source=('http://search.cpan.org/CPAN/authors/id/B/BW/BWATSON/Linux-Joystick-0.0.1.tar.gz')
md5sums=('152401b28b8575c04e48260b20f7e10d')
sha512sums=('f6d2a50d0e2b11009392bd0cf34a1fff20bec98abbe89161919c75bd9faba5a89c8c7031e04dc6a7aadf71acd0b0fe7ecc3af624fdd800e5d07c3a34aca315e6')
_distdir="Linux-Joystick-0.0.1"

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
