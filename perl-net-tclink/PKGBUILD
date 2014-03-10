# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-tclink'
pkgver='3.4'
pkgrel='1'
pkgdesc=""
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'openssl>=1.0.1.f' 'openssl>=1.0.1.f')
makedepends=()
url='http://search.cpan.org/dist/Net_TCLink'
source=('http://search.cpan.org/CPAN/authors/id/W/WI/WITTEN/Net_TCLink.pm-3.4.tar.gz')
md5sums=('45b8c8b68b007408e62613ccd9080e49')
sha512sums=('f4a495b64c79e9933f39bb59abdded55101a5e48371d1470814aadbbaacfde56bb1cb26e2525055e22bae46145bf5e7f32a2fd69aca074ac0e2108322edf040d')
_distdir="Net_TCLink.pm-3.4"

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
