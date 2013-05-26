# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-taint-util'
pkgver='0.08'
pkgrel='1'
pkgdesc="Test for and flip the taint flag without regex matches or eval"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Taint-Util'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Taint-Util-0.08.tar.gz')
md5sums=('4f081a8a6e82352741c0486784cbc23d')
sha512sums=('78a1ec5af26a21de4d63455caa401d26b7cfc58e32c33ab5ca1fa75063856c3866b8deba19dba518e0138c65d2cad184b1c682cd48b68d1ed4c0570017d0f7a8')
_distdir="Taint-Util-0.08"

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
