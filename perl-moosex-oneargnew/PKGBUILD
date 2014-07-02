# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-oneargnew'
pkgver='0.004'
pkgrel='1'
pkgdesc="teach ->new to accept single, non-hashref arguments"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0' 'perl-moosex-role-parameterized>=0' 'perl-namespace-autoclean>=0')
makedepends=()
url='http://search.cpan.org/dist/MooseX-OneArgNew'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/MooseX-OneArgNew-0.004.tar.gz')
md5sums=('53ea061c07674bdb6d60362cdadb4b2f')
sha512sums=('68ac4d303be3bca9ea18e98db7caaed7b0fb864a72c780d48e6f89c565ce084f14980cfbc16ca175b26387b05be6b409b29a0d75381d9084bd0cc0d2d82234e2')
_distdir="MooseX-OneArgNew-0.004"

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
