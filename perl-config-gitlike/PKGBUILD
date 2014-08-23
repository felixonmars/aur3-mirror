# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-config-gitlike'
pkgver='1.15'
pkgrel='1'
pkgdesc="git-compatible config file parsing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0' 'perl-moox-types-mooselike>=0' 'perl>=5.8.0')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='http://search.cpan.org/dist/Config-GitLike'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/Config-GitLike-1.15.tar.gz')
md5sums=('c4a8fea0f3e427ae3897ea23aaf8b1d0')
sha512sums=('cac600a0692d061e2cb02f3170e0387dce7063695a8b8f804cf60694d430cacfea1a269568a8bff3323ee6d112009c4c49fa8a192d03efb4080d2bae238080ae')
_distdir="Config-GitLike-1.15"

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
