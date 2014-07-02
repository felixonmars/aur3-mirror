# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-string-errf'
pkgver='0.007'
pkgrel='1'
pkgdesc="a simple sprintf-like dialect"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2' 'perl-params-util>=0' 'perl-string-formatter>=0.102081' 'perl-sub-exporter>=0' 'perl-timedate>=0')
makedepends=()
url='http://search.cpan.org/dist/String-Errf'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Errf-0.007.tar.gz')
md5sums=('27771ecf864f1ae81cb532fb3e2d42ed')
sha512sums=('33d38155faa74f16ad7c045998ddb0e38adb505d09adecff6635056ac78881d3e358770f37f1a9f4330ba0b2ff0d0c3c85b1b499ca73e906c083838ef28bfdbd')
_distdir="String-Errf-0.007"

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
