# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-kwalitee'
pkgver='1.22'
pkgrel='1'
pkgdesc="Test the Kwalitee of a distribution before you release it"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.007' 'perl-module-cpants-analyse>=0.92' 'perl-test-deep>=0' 'perl-test-tester>=0.108' 'perl-test-warnings>=0.009' 'perl-namespace-clean>=0')
makedepends=()
url='http://search.cpan.org/dist/Test-Kwalitee'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Kwalitee-1.22.tar.gz')
md5sums=('2b3ccaec94e75ab574b0e773f74ca884')
sha512sums=('80f8c1b0fe3016bf4a884bde2a23734afb6e3d4dfa248212bc7e5b7088b87fa66e80641bb292d0bc17e7f83135cc3d6c100c08aaab60a5429051c133e8e757ab')
_distdir="Test-Kwalitee-1.22"

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
