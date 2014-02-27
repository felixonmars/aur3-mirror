# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-app-recordstream'
pkgver='4.0.4'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-sqlite>=0' 'perl-dbi>=0' 'perl-date-manip>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-json>=0' 'perl-json-xs>=0' 'perl-list-moreutils>=0' 'perl-term-readkey>=0' 'perl-text-autoformat>=0' 'perl-text-csv>=0' 'perl-text-csv-xs>=0.99' 'perl-tie-ixhash>=0' 'perl-xml-twig>=0' 'perl-libwww>=0')
makedepends=()
url='http://search.cpan.org/dist/App-RecordStream'
source=('http://search.cpan.org/CPAN/authors/id/T/TS/TSIBLEY/App-RecordStream-4.0.4.tar.gz')
md5sums=('2b8a61a55311dfeed2c2e20f6d311988')
sha512sums=('dfe07209fe4d7a98d11939dab78da22f2471b8e144937216c113e7889654f62c6dbb95a192e0c6e0e08436f93c7c7c2e9d7e2c929335addd95aeba5f0dd60383')
_distdir="App-RecordStream-4.0.4"

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
