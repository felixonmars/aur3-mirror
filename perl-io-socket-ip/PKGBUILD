# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-io-socket-ip'
pkgver='0.29'
pkgrel='1'
pkgdesc="Family-neutral IP socket supporting both IPv4 and IPv6"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IO-Socket-IP'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/IO-Socket-IP-0.29.tar.gz')
md5sums=('6026bb1b4ac5c3a9481616335cc4c1e7')
sha512sums=('a685557a314407231fbd8146f869bd23f71480db95a8e552b05ac25a540bb6858ec31777f13bdc3de87e065c38f0498e0ffef04e5e6d583459eb75e2caae7ee0')
_distdir="IO-Socket-IP-0.29"

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
