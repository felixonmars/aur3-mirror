# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname='perl-log-dispatch-file-stamped'
pkgver='0.13'
pkgrel='1'
pkgdesc="Logging to date/time stamped files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-dispatch>=2.38' 'perl-namespace-clean')
makedepends=('perl-test-tempdir' 'perl-test-deep' 'perl-path-tiny')
url='http://search.cpan.org/dist/Log-Dispatch-File-Stamped'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Log-Dispatch-File-Stamped-${pkgver}.tar.gz")
md5sums=('fc7a28777545c15355c2505d0ce80f31')
sha512sums=('986a61830e54570690a6e921e18f833c6e545dfc52b7365104652572ad105b905203c0895a6748f2f8c7471efcd25600676148694a2104b00c187d0b1097183b')

build() {
  _distdir="${srcdir}/Log-Dispatch-File-Stamped-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  _distdir="${srcdir}/Log-Dispatch-File-Stamped-${pkgver}"
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  _distdir="${srcdir}/Log-Dispatch-File-Stamped-${pkgver}"
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
