# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moose-autobox'
pkgver='0.15'
pkgrel='1'
pkgdesc="Autoboxed wrappers for Native Perl datatypes "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.42' 'perl-syntax-keyword-junction>=0' 'perl-autobox>=2.23')
makedepends=()
checkdepends=('perl-test-exception>=0.21')
url='http://search.cpan.org/dist/Moose-Autobox'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Moose-Autobox-0.15.tar.gz')
md5sums=('001314caf762f35a4374d18258f5a2fa')
sha512sums=('7c030a081692c5818f76f910869bc3431100b6e68d40712e33c3a5e0043633a2ac22cc5bbc69b224c35f05fb9f82f81b98b1c93adc854d4ae741dfeb5c9cf79d')
_distdir="Moose-Autobox-0.15"

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
